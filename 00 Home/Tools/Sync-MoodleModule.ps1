param(
    [Parameter(Mandatory = $true)]
    [int]$CourseId,

    [Parameter(Mandatory = $true)]
    [int]$ModuleNumber,

    [Parameter(Mandatory = $true)]
    [string]$CoursePath,

    [string]$VaultRoot = (Get-Location).Path,
    [string]$TokenPath = "C:\tmp\ouk_moodle_token.txt",
    [string]$MoodleUrl = "https://somas.ouk.ac.ke/webservice/rest/server.php",
    [switch]$NoDownload
)

$ErrorActionPreference = "Stop"

function Get-SafeName {
    param([string]$Name)
    $safe = $Name -replace '[\\/:*?"<>|]', '-'
    $safe = $safe -replace '\s+', ' '
    return $safe.Trim()
}

function ConvertTo-Text {
    param([string]$Html)
    $text = $Html -replace '<script[\s\S]*?</script>', ' '
    $text = $text -replace '<style[\s\S]*?</style>', ' '
    $text = $text -replace '</(h1|h2|h3|h4|p|div|li|label|tr|td|pre)>', "`n"
    $text = $text -replace '<[^>]+>', ' '
    $text = [System.Net.WebUtility]::HtmlDecode($text)
    $text = $text -replace '[ \t]+', ' '
    $text = $text -replace "(`r?`n\s*){2,}", "`n`n"
    return $text.Trim()
}

function Invoke-Moodle {
    param(
        [string]$FunctionName,
        [hashtable]$Params
    )

    $body = @{
        wstoken            = $script:Token
        wsfunction         = $FunctionName
        moodlewsrestformat = "json"
    }

    foreach ($key in $Params.Keys) {
        $body[$key] = $Params[$key]
    }

    return Invoke-RestMethod -Method Post -Uri $script:MoodleUrl -Body $body
}

function Save-Json {
    param(
        [object]$Data,
        [string]$Path
    )
    $Data | ConvertTo-Json -Depth 80 | Set-Content -Path $Path -Encoding UTF8
}

function Get-QuizQuestions {
    param([int]$AttemptId)

    $questions = New-Object System.Collections.Generic.List[object]

    for ($page = 0; $page -lt 100; $page++) {
        $attemptData = Invoke-Moodle "mod_quiz_get_attempt_data" @{
            attemptid = $AttemptId
            page      = $page
        }

        if (-not $attemptData.questions -or $attemptData.questions.Count -eq 0) {
            break
        }

        foreach ($question in $attemptData.questions) {
            $questions.Add([pscustomobject]@{
                page     = $page
                slot     = $question.slot
                type     = $question.type
                status   = $question.status
                mark     = $question.maxmark
                text     = ConvertTo-Text $question.html
            })
        }
    }

    return $questions
}

if (-not (Test-Path $TokenPath)) {
    throw "Token file not found: $TokenPath"
}

$script:Token = (Get-Content -Raw $TokenPath).Trim()
$script:MoodleUrl = $MoodleUrl

$resolvedCoursePath = if ([System.IO.Path]::IsPathRooted($CoursePath)) {
    $CoursePath
} else {
    Join-Path $VaultRoot $CoursePath
}

if (-not (Test-Path $resolvedCoursePath)) {
    throw "Course path not found: $resolvedCoursePath"
}

$contents = Invoke-Moodle "core_course_get_contents" @{ courseid = $CourseId }
$quizzes = Invoke-Moodle "mod_quiz_get_quizzes_by_courses" @{ "courseids[0]" = $CourseId }

$modulePattern = "Module\s*$ModuleNumber(\D|$)"
$section = $contents | Where-Object { $_.name -match $modulePattern } | Select-Object -First 1

if (-not $section) {
    throw "Module $ModuleNumber was not found in Moodle course $CourseId."
}

$moduleTitle = ($section.name -replace "^\s*Module\s*$ModuleNumber\s*:\s*", "").Trim()
if (-not $moduleTitle) {
    $moduleTitle = $section.name
}

$modulePrefix = "Module {0:D2} - {1}" -f $ModuleNumber, (Get-SafeName $moduleTitle)
$sourceDir = Join-Path $resolvedCoursePath ("01 Source Materials\" + $modulePrefix)
$assignmentsDir = Join-Path $resolvedCoursePath "03 Assignments"

New-Item -ItemType Directory -Force -Path $sourceDir | Out-Null
New-Item -ItemType Directory -Force -Path $assignmentsDir | Out-Null

Save-Json $section (Join-Path $sourceDir "moodle-section.json")
Save-Json $quizzes (Join-Path $sourceDir "moodle-quizzes.json")

$resources = $section.modules | Where-Object { $_.modname -eq "resource" }
$downloadedFiles = New-Object System.Collections.Generic.List[string]
$allowedExtensions = @(".html", ".htm", ".pdf", ".csv", ".xlsx", ".xls", ".ipynb", ".txt", ".docx", ".pptx")

if (-not $NoDownload) {
    foreach ($resource in $resources) {
        foreach ($content in $resource.contents) {
            if ($content.type -ne "file") {
                continue
            }

            $filename = Get-SafeName $content.filename
            $extension = [System.IO.Path]::GetExtension($filename).ToLowerInvariant()

            if ($extension -notin $allowedExtensions) {
                continue
            }

            if ($filename -eq "index.html") {
                $courseFolderName = Split-Path -Leaf $resolvedCoursePath
                $filename = "$(Get-SafeName $courseFolderName) - $modulePrefix.html"
            }

            $target = Join-Path $sourceDir $filename
            $url = $content.fileurl + "&token=" + [uri]::EscapeDataString($script:Token)
            Invoke-WebRequest -Uri $url -OutFile $target
            $downloadedFiles.Add($filename)

            if ($target -match '\.html?$') {
                $html = Get-Content -Raw $target
                $txtName = [System.IO.Path]::GetFileNameWithoutExtension($filename) + ".txt"
                ConvertTo-Text $html | Set-Content -Path (Join-Path $sourceDir $txtName) -Encoding UTF8
                $downloadedFiles.Add($txtName)
            }

            if ($target -match '\.ipynb$') {
                try {
                    $notebook = Get-Content -Raw $target | ConvertFrom-Json
                    $parts = New-Object System.Collections.Generic.List[string]
                    $fence = '```'

                    foreach ($cell in $notebook.cells) {
                        $src = ($cell.source -join '').Trim()
                        if ($src.Length -eq 0) {
                            continue
                        }

                        if ($cell.cell_type -eq "code") {
                            $parts.Add($fence + "python" + "`n" + $src + "`n" + $fence)
                        } else {
                            $parts.Add($src)
                        }
                    }

                    $mdName = [System.IO.Path]::GetFileNameWithoutExtension($filename) + ".md"
                    Set-Content -Path (Join-Path $sourceDir $mdName) -Value ($parts -join "`n`n") -Encoding UTF8
                    $downloadedFiles.Add($mdName)
                } catch {
                    Write-Warning "Could not convert notebook: $filename"
                }
            }
        }
    }
}

$activityLines = New-Object System.Collections.Generic.List[string]
$activityLines.Add("# $modulePrefix - Moodle Extract")
$activityLines.Add("")
$activityLines.Add("Read-only Moodle extraction. No quiz attempt was started, saved, checked, or submitted.")
$activityLines.Add("")
$activityLines.Add("## Section")
$activityLines.Add("- Moodle section: ``$($section.name)``")
$activityLines.Add("- Section id: ``$($section.id)``")
$activityLines.Add("")
$activityLines.Add("## Activities")
$activityLines.Add("")
$activityLines.Add("| Name | Type | Visible | Instance |")
$activityLines.Add("| --- | --- | --- | --- |")

foreach ($module in $section.modules) {
    $activityLines.Add("| $($module.name) | $($module.modname) | $($module.visible) | $($module.instance) |")
}

$activityLines.Add("")
$activityLines.Add("## Downloaded Source Files")
$activityLines.Add("")

if ($downloadedFiles.Count -gt 0) {
    foreach ($file in ($downloadedFiles | Sort-Object -Unique)) {
        $activityLines.Add("- [[$file]]")
    }
} else {
    $activityLines.Add("- No files downloaded.")
}

$activityLines.Add("")
$activityLines.Add("## AI Handoff")
$activityLines.Add('1. Use the downloaded source text to create or update the module note in `02 Notes`.')
$activityLines.Add('2. Use the quiz raw file to answer the quiz in the matching `Module NN - Quizzes.md` file.')
$activityLines.Add('3. Update course indexes and `Quiz Status.md` after reviewing the extracted material.')

Set-Content -Path (Join-Path $sourceDir "$modulePrefix - Moodle Extract.md") -Value ($activityLines -join "`n") -Encoding UTF8

$moduleQuizRows = $quizzes.quizzes | Where-Object {
    $_.name -match $modulePattern -or $_.section -eq $ModuleNumber
}

$quizLines = New-Object System.Collections.Generic.List[string]
$quizLines.Add("# Module {0:D2} - Quiz Raw Extract" -f $ModuleNumber)
$quizLines.Add("")
$quizLines.Add("Read-only extraction. No answers were saved, checked, or submitted in Moodle.")
$quizLines.Add("")
$quizLines.Add("## Availability Summary")
$quizLines.Add("")
$quizLines.Add("| Quiz | Moodle state | Attempts | Grade | Questions read |")
$quizLines.Add("| --- | --- | --- | --- | --- |")

$quizDetails = New-Object System.Collections.Generic.List[object]

foreach ($quiz in $moduleQuizRows) {
    $attempts = Invoke-Moodle "mod_quiz_get_user_attempts" @{
        quizid = $quiz.id
        status = "all"
    }

    $best = Invoke-Moodle "mod_quiz_get_user_best_grade" @{ quizid = $quiz.id }
    $attempt = $attempts.attempts | Sort-Object timestart -Descending | Select-Object -First 1
    $state = if ($attempt) { $attempt.state } else { "skipped" }
    $attemptCount = if ($attempts.attempts) { $attempts.attempts.Count } else { 0 }
    $questions = @()

    if ($attempt -and $attempt.state -eq "inprogress") {
        $questions = Get-QuizQuestions -AttemptId $attempt.id
    }

    $quizLines.Add("| $($quiz.name) | $state | $attemptCount/$($quiz.attempts) | $($quiz.grade) | $($questions.Count) |")
    $quizDetails.Add([pscustomobject]@{
        quiz      = $quiz
        attempts  = $attempts
        best      = $best
        attempt   = $attempt
        questions = $questions
    })
}

foreach ($detail in $quizDetails) {
    $quizLines.Add("")
    $quizLines.Add("## $($detail.quiz.name)")

    if ($detail.attempt) {
        $started = [DateTimeOffset]::FromUnixTimeSeconds($detail.attempt.timestart).ToOffset([TimeSpan]::FromHours(3)).ToString("yyyy-MM-dd HH:mm:ss zzz")
        $quizLines.Add("- Attempt id: ``$($detail.attempt.id)``")
        $quizLines.Add("- State: ``$($detail.attempt.state)``")
        $quizLines.Add("- Started: ``$started``")
    } else {
        $quizLines.Add("- No attempt found.")
    }

    if ($detail.questions.Count -eq 0) {
        $quizLines.Add("")
        $quizLines.Add("Questions were not readable. If the quiz has not been started, provide the questions manually or explicitly approve starting that exact quiz.")
        continue
    }

    foreach ($question in $detail.questions) {
        $quizLines.Add("")
        $quizLines.Add("### Question $($question.slot)")
        $quizLines.Add("- Type: ``$($question.type)``")
        $quizLines.Add("- Mark: ``$($question.mark)``")
        $quizLines.Add("")
        $quizLines.Add($question.text)
        $quizLines.Add("")
        $quizLines.Add("Answer:")
        $quizLines.Add("")
    }
}

Set-Content -Path (Join-Path $assignmentsDir ("Module {0:D2} - Quiz Raw Extract.md" -f $ModuleNumber)) -Value ($quizLines -join "`n") -Encoding UTF8

$practicalActivities = $section.modules | Where-Object { $_.modname -in @("vpl", "assign", "assignment") -or $_.name -match "Practical|Task|Assignment" }

if ($practicalActivities) {
    $practicalLines = New-Object System.Collections.Generic.List[string]
    $practicalLines.Add("# Module {0:D2} - Practical Raw Extract" -f $ModuleNumber)
    $practicalLines.Add("")
    $practicalLines.Add("Read-only extraction. VPL and assignment instructions may not be exposed through the available Moodle REST API.")
    $practicalLines.Add("")
    $practicalLines.Add("## Practical-Like Activities")
    $practicalLines.Add("")

    foreach ($activity in $practicalActivities) {
        $practicalLines.Add("- ``$($activity.name)`` - $($activity.modname), instance ``$($activity.instance)``")
    }

    $practicalLines.Add("")
    $practicalLines.Add("## AI Handoff")
    $practicalLines.Add("- If instructions are not shown here, open the Moodle practical manually and paste the prompt.")
    $practicalLines.Add("- Keep code simple and close to the course examples.")

    $practicalPath = Join-Path $assignmentsDir ("Module {0:D2} - Practical Raw Extract.md" -f $ModuleNumber)
    Set-Content -Path $practicalPath -Value ($practicalLines -join "`n") -Encoding UTF8
} else {
    $practicalPath = $null
}

Write-Output "Module extracted: $($section.name)"
Write-Output "Source folder: $sourceDir"
Write-Output "Quiz raw file: $(Join-Path $assignmentsDir ("Module {0:D2} - Quiz Raw Extract.md" -f $ModuleNumber))"
if ($practicalPath) {
    Write-Output "Practical raw file: $practicalPath"
} else {
    Write-Output "Practical raw file: none, no practical-like activity found"
}
