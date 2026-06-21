---
type: rules
created: 2026-05-01
---

# AI Retrieval Rules

## Read This First
Every AI working in this vault must read this file first, then read [[Naming Rules]], and then read the relevant workflow file such as [[Moodle Workflow]] before changing course files.

## Non-Negotiable Rules
- Follow the existing vault structure and workflow exactly.
- Do not invent a new folder design, naming style, scraper, Moodle flow, quiz format, or assignment format.
- If the workflow does not cover the situation, stop and report the blocker instead of creating a workaround.
- If Moodle/API access fails, report the exact blocker and what was already completed.
- If a required source, quiz, practical prompt, dataset, or course ID is missing, report that it is missing and ask for it.
- Do not create placeholders unless the workflow explicitly says to create one.
- Do not leave temporary files, raw extracts, scratch scripts, token dumps, or debug outputs in course folders.

## Priority Order
1. Use files inside this vault as the first source of truth.
2. Prefer course source materials and my own notes over general background knowledge.
3. If the vault does not contain enough information, state that clearly before filling gaps from general knowledge.

## Preferred Sources
- `01 Academic/.../01 Source Materials` for official course documents
- `01 Academic/.../02 Notes` for my study notes and summaries
- `03 Assignments` for quizzes, practical tasks, case studies, reports, submissions, and exam prep

## Course Folder Design
- Keep course root folders simple and consistent:
  - `01 Source Materials`: raw Moodle/source/reference files
  - `02 Notes`: clean study notes
  - `03 Assignments`: quizzes, practicals, case studies, reports, submissions, and exam prep
- Keep course root files for course navigation, module maps, and Moodle tracking only.
- Do not introduce a different folder structure unless the user explicitly asks for it.
- Every course folder should have this structure even before content exists:
  - `00 Course Index.md`
  - `Module Map.md`
  - `01 Source Materials/Source Materials Index.md`
  - `02 Notes/Notes Index.md`
  - `03 Assignments/Assignments Index.md`

## Response Standard
- Cite the course and file name when answering from vault content.
- Separate `From my files` from `General explanation` when both are used.
- Do not treat unstated assumptions as facts from the vault.
- Code should be simplified to mirror coursework exactly, not beautified or over-engineered by AI.

## File Hygiene
- Do not leave important source files only in `99 Inbox`.
- Add a short markdown note for major PDFs after reading them.
- Rename vague files once their course and topic are known.
- Keep one course-level `Source Materials Index.md`; do not create per-module `Source Index.md` files.

## Notes and Quiz Workflow
- When I provide notes, extract the needed study information into the relevant course `02 Notes` folder.
- For courses where each module has one note, keep the note as `02 Notes/Module NN - Topic.md`; do not create a one-file folder for that module.
- For courses where source files are manageable in one place, keep source files directly in `01 Source Materials` and maintain one `Source Materials Index.md`; do not create one `Source Index.md` per module.
- Do not create a `04 Revision` folder by default; keep revision and exam prep material in `03 Assignments` unless the user asks for a separate revision area.
- Treat case studies as assignments. Keep each case study's details/question file, report/submission, final answer, and review note together under `03 Assignments`, usually in a `Case Studies` subfolder when there are many.
- Rename case study details/question files as `Case Study Details - Module NN - Topic.ext` after reading enough content to understand the task.
- When I provide quizzes or when quizzes are extracted from Moodle, consolidate all questions, options, answers, and short explanations for that module into a single `Module NN - Quizzes.md` file in the relevant course `03 Assignments` folder.
- Treat `Module NN - Quiz Raw Extract.md` and `Module NN - Practical Raw Extract.md` as temporary scraper artifacts. Delete them after the clean quiz or practical file is created.
- When I provide official module names, use those names as the source of truth for course indexes and module maps.
- For Moodle-backed courses, follow [[Moodle Workflow]].
- A Moodle module is not complete until the [[Moodle Workflow#Module Update Definition Of Done]] checklist is satisfied.
- Do not start or submit Moodle quiz attempts without explicit approval for that exact quiz.
- Do not leave processed raw files in `99 Inbox` after they have been classified or converted.

## Required Final Report
When finished, report:
- What was created.
- What was updated.
- What was deleted or moved.
- What could not be completed and why.
- Whether temporary/raw files remain.
