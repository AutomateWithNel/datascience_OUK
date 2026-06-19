---
type: course-workflow
course_code: DSC 201
course_title: Python for Data Science
created: 2026-06-19
---

# Moodle Sync Workflow

Use this course-specific workflow together with [[../../../../00 Home/Moodle Workflow]].

## Current Scope
- Active open modules: 1, 2, 3, and 4.
- Do not treat Modules 5 to 10 as active until Moodle exposes files or activities inside them.
- Do not use the final examination quiz in normal module-note work.

## Read-Only Sync Checklist
1. Query `core_course_get_contents` for course `16`.
2. Update [[Moodle Exposure Report]] with visible modules and activities.
3. Download exposed resource files for open modules only.
4. Extract readable text from PDF, HTML, TXT, CSV, or XLSX files.
5. Update module notes in `02 Notes`.
6. Query quiz list using `mod_quiz_get_quizzes_by_courses`.
7. Query attempt and score status using:
   - `mod_quiz_get_quiz_access_information`
   - `mod_quiz_get_user_attempts`
   - `mod_quiz_get_user_best_grade`
8. Update [[03 Assignments/Quiz Status]].

## Quiz Question Rule
Quiz questions can be read from an existing `in progress` attempt using read-only attempt APIs.

Quiz questions before any attempt exists should come from the user as copied text. Do not start a Moodle attempt just to reveal questions unless the user explicitly approves that exact quiz.

## Current Outputs
- [[Moodle Exposure Report]]
- [[Moodle Resource Comparison]]
- [[03 Assignments/Quiz Status]]
- [[02 Notes/Module 01 - NumPy/Module 01 - NumPy]]
- [[02 Notes/Module 02 - Introduction to Pandas/Module 02 - Introduction to Pandas]]
- [[02 Notes/Module 03 - Data Loading and File Formats in Pandas/Module 03 - Data Loading and File Formats in Pandas]]
- [[02 Notes/Module 04 - Data Cleaning and Preparation/Module 04 - Data Cleaning and Preparation]]
