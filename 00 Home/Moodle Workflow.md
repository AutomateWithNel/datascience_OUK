---
type: workflow
created: 2026-06-19
---

# Moodle Workflow

Use this workflow when a course has Moodle access through a web service token.

Before using this workflow, read [[AI Rules]] first. If any instruction here conflicts with [[AI Rules]], follow [[AI Rules]] and report the conflict.

## Safety Rules
- Use read-only Moodle API calls by default.
- Do not start a quiz attempt unless the user explicitly approves that exact quiz.
- Do not submit, save, or process quiz answers through Moodle unless the user explicitly approves that exact action.
- Do not print or store the Moodle token in vault notes.
- Use the token only from a local temporary file such as `C:\tmp\ouk_moodle_token.txt`.

## Course Sync Steps
1. Query course contents with `core_course_get_contents`.
2. Identify open sections/modules and visible activities.
3. Download exposed learning resources only when they are available through resource contents.
4. Extract text from PDFs, HTML, or text resources.
5. Summarize extracted learning material into `02 Notes`.
6. Save quiz/activity listings and score status into `03 Assignments`.
7. Mark modules with no files or activities as visible but not usable yet.

Do not replace these steps with a custom scraper or manual workaround unless the user explicitly asks for a different method. If any step fails, report the blocker and stop before making assumptions.

## Reusable Scraper
Use [[Moodle Module Scraper]] when a module opens and the extraction can be automated.

The scraper creates source files and temporary raw extraction files. The AI then performs the final cleanup: notes, answers, practical draft, index updates, and removal of processed raw extracts.

## Raw Extract Rule
- `Module NN - Quiz Raw Extract.md` is temporary.
- Keep it only while converting extracted Moodle questions into `Module NN - Quizzes.md`.
- Once `Module NN - Quizzes.md` exists and contains the module questions, options, and answers, delete `Module NN - Quiz Raw Extract.md`.
- If the clean quiz file needs to be rebuilt, rerun the scraper to regenerate the raw extract.
- `Module NN - Practical Raw Extract.md` follows the same rule: delete it after creating the clean practical task file, or delete it if no practical prompt was exposed.

## Module Update Definition Of Done
A module update is successful only when all applicable items below are complete:

1. Moodle was checked with read-only calls only.
2. The official Moodle module name was used in folder names, note titles, indexes, and reports.
3. Exposed Moodle resource files were downloaded into `01 Source Materials`.
4. HTML resources were converted to `.txt`; notebooks were converted to readable `.md` when present.
5. `01 Source Materials/Source Materials Index.md` lists the module source files.
6. A source-backed clean note exists directly in `02 Notes/Module NN - Official Module Name.md`.
7. Quiz status was checked and recorded in `03 Assignments/Quiz Status.md`.
8. If an existing attempt exposes quiz questions, a clean `03 Assignments/Module NN - Quizzes.md` exists with only that module's questions, options, and draft answers.
9. If a practical task exists, `03 Assignments/Module NN - Practical Task.md` exists with the real prompt or a clearly marked placeholder when Moodle shows a practical activity but does not expose the prompt.
10. If a practical script is needed, it exists as `03 Assignments/ModuleNNPractical.py` and uses simple course-style code.
11. If a case study, report, or submission exists, it is kept under `03 Assignments`, with related details/question file, report/submission, final answer, and review note kept together.
12. Course indexes and reports were updated:
    - `00 Course Index.md`
    - `Module Map.md`
    - `Moodle Exposure Report.md`
    - `01 Source Materials/Source Materials Index.md`
    - `02 Notes/Notes Index.md`
    - `03 Assignments/Assignments Index.md`
13. No scratch scripts, temporary HTML slots, token dumps, raw extracts, or one-off debug files remain in `03 Assignments`.
14. No Moodle token value was printed or saved in vault files.

## AI Start-To-End Module Process
When asked to handle a newly opened module:

1. Read [[AI Rules]], [[Naming Rules]], this file, and [[Moodle Module Scraper]].
2. Identify the course path, course ID, and module number.
3. Run the Moodle scraper from the vault root.
4. Read the new source folder and temporary raw quiz/practical extracts.
5. Create the clean module note, quiz answer file, and practical task file.
6. Keep code simple and close to the course examples; do not beautify or over-engineer.
7. Update all indexes and reports listed in the definition of done.
8. Delete processed raw extracts.
9. Run a final check for leftover scratch files and token leakage.
10. Report what was created, what was updated, and any blocker such as a practical prompt that Moodle did not expose. If no practical activity exists, do not create a practical placeholder.

If the course ID, module number, token file, source file, quiz access, dataset, or practical prompt is missing, stop and report exactly what is missing. Do not invent content or create a parallel workflow.

## Quiz Status Steps
1. List quizzes with `mod_quiz_get_quizzes_by_courses`.
2. Check access metadata with `mod_quiz_get_quiz_access_information`.
3. Check existing attempts with `mod_quiz_get_user_attempts`.
4. Check best grade with `mod_quiz_get_user_best_grade`.
5. Classify each quiz:
   - `done`: at least one finished attempt or best grade exists.
   - `in progress`: an unfinished attempt exists.
   - `skipped`: quiz is visible but has no attempts.
   - `blocked`: Moodle reports access restrictions.
6. If a quiz already has an `in progress` attempt, questions may be readable with `mod_quiz_get_attempt_summary` or `mod_quiz_get_attempt_data` without starting a new attempt.
7. If quiz questions are needed before any attempt exists, ask the user to provide the question text manually unless the user explicitly approves starting that exact quiz.

## Clean Quiz File Rule
- Keep quiz state, attempts, grades, and question-read counts only in `03 Assignments/Quiz Status.md`.
- Do not repeat an availability/status table inside `Module NN - Quizzes.md`.
- The clean module quiz file should contain the quiz heading, any necessary read-only note, questions, options, and answers.

## Vault Outputs
For each course, maintain:
- `Moodle Exposure Report.md`
- `Moodle Sync Workflow.md`
- `03 Assignments/Quiz Status.md`
- module notes as direct files inside `02 Notes`

## Preferred Module Rule
Use official Moodle module names as the source of truth for course indexes and module maps.
When a module has only one note file, do not create a module subfolder under `02 Notes`; use `02 Notes/Module NN - Official Module Name.md`.
For source materials, keep one course-level source index and store source files directly in `01 Source Materials`; avoid one-source-index-per-module folders unless a course has unusually large source bundles.

## Moodle Comparison Reports
`Moodle Resource Comparison.md` is optional and temporary. Create it only for a one-time audit when checking whether local files match Moodle resources. Remove it after the course/module has been processed and the normal indexes are correct.
