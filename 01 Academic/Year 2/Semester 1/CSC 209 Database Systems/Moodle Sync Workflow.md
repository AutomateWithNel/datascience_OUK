---
type: moodle-sync-workflow
course_code: CSC 209
course_title: Database Systems
course_id: 49
updated: 2026-06-21
---

# Moodle Sync Workflow

Use the universal workflow in [[../../../../00 Home/Moodle Workflow]] and the scraper guide in [[../../../../00 Home/Moodle Module Scraper]].

## Course Values
- Course ID: `49`
- Course path: `01 Academic/Year 2/Semester 1/CSC 209 Database Systems`
- Token path: `C:\tmp\ouk_moodle_token.txt`

## Local Design
- `01 Source Materials`: raw Moodle/source/reference files, direct files only.
- `02 Notes`: clean study notes, one direct note file per module/topic.
- `03 Assignments`: quizzes, case studies, reports, submissions, reflections, and exam prep.
- Root files: course navigation, module map, and Moodle tracking.

## Current Sync State
- Quiz status refreshed from Moodle on `2026-06-21`.
- Readable completed quiz review questions were converted into clean module quiz files.
- Case study prompt files were renamed to `Case Study Details - Module NN - Topic.ext`.
- Temporary raw extracts were removed after clean files were created.

## Next Sync Rule
When new CSC 209 Moodle material appears, run the same read-only process:
1. Query Moodle contents and quiz status.
2. Download only useful exposed resources.
3. Update `01 Source Materials/Source Materials Index.md`.
4. Update or create direct module notes in `02 Notes`.
5. Update `03 Assignments/Quiz Status.md` and clean module quiz files.
6. Keep case study details, reports/submissions, and reviews together in `03 Assignments/Case Studies`.
7. Delete raw extracts and scratch files after clean outputs exist.
