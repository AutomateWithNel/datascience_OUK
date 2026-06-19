---
type: workflow
created: 2026-06-19
---

# Moodle Workflow

Use this workflow when a course has Moodle access through a web service token.

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

## Vault Outputs
For each course, maintain:
- `Moodle Exposure Report.md`
- `Moodle Resource Comparison.md`
- `Moodle Sync Workflow.md`
- `03 Assignments/Quiz Status.md`
- module notes inside `02 Notes`

## Preferred Module Rule
Use official Moodle module names as the source of truth for course indexes and module maps.
