---
type: workflow
created: 2026-06-20
---

# Moodle Module Scraper

Use this when a Moodle module opens and we want the same extraction workflow without spending tokens rediscovering the process.

Read [[AI Rules]], [[Naming Rules]], and [[Moodle Workflow]] before using this scraper. This scraper is the standard extraction path; do not create a different Moodle extraction approach unless the user explicitly asks for it.

## What The Tool Does
- Finds a module section by course ID and module number.
- Downloads useful exposed Moodle resource files such as HTML, PDF, CSV, Excel, notebooks, text, Word, and PowerPoint files.
- Converts HTML resources into `.txt`.
- Converts `.ipynb` notebooks into readable `.md`.
- Lists all activities in the module.
- Reads quiz questions only from an existing in-progress attempt.
- Creates temporary raw quiz and practical extraction files for the AI to finish.

## What The Tool Does Not Do
- It does not start quiz attempts.
- It does not save, check, or submit quiz answers.
- It does not print or save the Moodle token.
- It does not invent practical instructions when Moodle does not expose them.
- It does not keep Moodle static support files such as CSS, JavaScript, generated images, or build zips.

## Command
Run from the vault root:

```powershell
.\00 Home\Tools\Sync-MoodleModule.ps1 `
  -CourseId [course id] `
  -ModuleNumber [module number] `
  -CoursePath "01 Academic\Year N\Semester N\COURSE 123 Course Title"
```

Set these values for the target course/module:
- `-CourseId`
- `-CoursePath`
- `-ModuleNumber`

If the source files are already downloaded and only the Moodle activity/quiz extraction should be refreshed, add:

```powershell
-NoDownload
```

## Expected Outputs
The tool may write source files first to a temporary module staging folder:

```text
01 Source Materials\Module NN - Official Moodle Module Name
```

During final cleanup, move useful source files into `01 Source Materials`, update `Source Materials Index.md`, and delete the temporary module staging folder when it is empty.

It writes a temporary raw quiz file to:

```text
03 Assignments\Module NN - Quiz Raw Extract.md
```

It writes `03 Assignments\Module NN - Practical Raw Extract.md` only when Moodle exposes a practical-like activity such as VPL or assignment.

Raw extract files are not final vault notes. Delete them after the clean `Module NN - Quizzes.md` or `Module NN - Practical Task.md` file has been created. If a raw extract is needed again, rerun the scraper.

## AI Handoff Prompt

```text
Use the Moodle module scraper outputs for this course/module.

Course path:
[course path]

Module number:
[module number]

Do the final AI step:
1. Read the new source folder.
2. Move useful source files into the course `01 Source Materials` folder and update `Source Materials Index.md`.
3. Convert Module NN - Quiz Raw Extract.md into Module NN - Quizzes.md with answers from the source notes.
4. If Module NN - Practical Raw Extract.md exists, convert it into a clean practical task file when the prompt is exposed.
5. Update the course indexes, Moodle reports, and Quiz Status.md.
6. Delete the processed raw extract files and empty source staging folder.

Rules:
- Read `00 Home/AI Rules.md` first.
- Use read-only Moodle workflow only.
- Do not save, check, submit, or start any quiz.
- Keep code simple and close to the course examples.
- Do not leave scratch scripts in 03 Assignments.
- If any required input is missing, report the blocker instead of inventing a workaround.
```

## What The AI Must Finish After Running The Scraper
The scraper is only the extraction step. The module is not done until the AI has created the clean vault outputs.

Required final files:
- `01 Source Materials\Source Materials Index.md`
- `02 Notes\Module NN - Official Module Name.md`
- `03 Assignments\Module NN - Quizzes.md` when quiz questions are available
- `03 Assignments\Module NN - Practical Task.md` only when a practical activity exists or when the user manually provides a practical prompt
- `03 Assignments\ModuleNNPractical.py` when the practical needs a script

Required updates:
- `00 Course Index.md`
- `Module Map.md`
- `Moodle Exposure Report.md`
- `01 Source Materials\Source Materials Index.md`
- `02 Notes\Notes Index.md`
- `03 Assignments\Assignments Index.md`
- `03 Assignments\Quiz Status.md`

Final checks:
- Each quiz file contains only its own questions, options, and answers.
- Quiz state, attempts, grades, and question-read counts are kept only in `Quiz Status.md`.
- Module notes are direct files in `02 Notes`, not one-file module subfolders.
- Source materials are direct files in `01 Source Materials`, listed in one course-level source index.
- Case studies, reports, submissions, and reviewed solutions are kept under `03 Assignments`, with related files together.
- No processed raw extract files are left in `03 Assignments`.
- No scratch scripts are left in `03 Assignments`.
- No practical placeholder is created when the module has no practical activity.
- No Moodle token value appears in any vault note.
- Practical code uses the course style: simple Pandas commands, local CSV filename, minimal comments.
- Any blocker is reported clearly, including what was attempted and what remains incomplete.

## Optional Audit File
Do not create or keep `Moodle Resource Comparison.md` during the normal module workflow. Use it only as a temporary audit file when the task is specifically to compare local files against Moodle resources, then delete it after the comparison is resolved.
