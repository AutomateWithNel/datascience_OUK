---
type: course-workflow
course_code: DSC 201
course_title: Python for Data Science
created: 2026-06-19
---

# Moodle Sync Workflow

Use this course-specific workflow together with [[../../../../00 Home/Moodle Workflow]].

## Current Scope
- Modules 1 to 10 were open/exposed and processed.
- All DSC 201 module quizzes are complete as of the 2026-06-21 Moodle status check.
- Do not use the final examination quiz in normal module-note work.

## Course Folder Design
- Keep source files directly in `01 Source Materials`.
- Keep one course-level source index at [[01 Source Materials/Source Materials Index]].
- Keep module notes directly in `02 Notes` as `Module NN - Official Module Name.md`.
- Keep quiz files, practical tasks, practical scripts, and quiz status in `03 Assignments`.
- Keep quiz availability/status summaries only in [[03 Assignments/Quiz Status]], not inside individual module quiz files.
- Do not keep processed raw extracts or scratch scripts.

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
- [[03 Assignments/Quiz Status]]
- [[02 Notes/Module 01 - NumPy]]
- [[02 Notes/Module 02 - Introduction to Pandas]]
- [[02 Notes/Module 03 - Data Loading and File Formats in Pandas]]
- [[02 Notes/Module 04 - Data Cleaning and Preparation]]
- [[02 Notes/Module 05 - Data Wrangling]]
- [[02 Notes/Module 06 - Visualization and Plotting]]
- [[02 Notes/Module 07 - Aggregation and Group Operations]]
- [[02 Notes/Module 08 - Exploratory Data Analysis (Deep Dive)]]
- [[02 Notes/Module 09 - Handling Time Series Data]]
- [[02 Notes/Module 10 - Introduction to modelling libraries in python]]

## Removed Audit File
`Moodle Resource Comparison.md` was an early local-vs-Moodle audit artifact. It is not part of the normal course folder design and was removed after the course materials were processed.
