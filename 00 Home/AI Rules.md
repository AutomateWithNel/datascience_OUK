---
type: rules
created: 2026-05-01
---

# AI Retrieval Rules

## Priority Order
1. Use files inside this vault as the first source of truth.
2. Prefer course source materials and my own notes over general background knowledge.
3. If the vault does not contain enough information, state that clearly before filling gaps from general knowledge.

## Preferred Sources
- `01 Academic/.../01 Source Materials` for official course documents
- `01 Academic/.../02 Notes` for my study notes and summaries
- `03 Assignments` and `04 Revision` for applied work and exam prep

## Response Standard
- Cite the course and file name when answering from vault content.
- Separate `From my files` from `General explanation` when both are used.
- Do not treat unstated assumptions as facts from the vault.

## File Hygiene
- Do not leave important source files only in `99 Inbox`.
- Add a short markdown note for major PDFs after reading them.
- Rename vague files once their course and topic are known.

## Notes and Quiz Workflow
- When I provide notes, extract the needed study information into the relevant course `02 Notes` folder.
- When I provide quizzes or when quizzes are extracted from Moodle, consolidate all questions, options, answers, and short explanations for that module into a single `Module NN - Quizzes.md` file in the relevant course `03 Assignments` folder.
- Follow the course organization style used in `01 Academic/Year 2/Semester 1/CSC 209 Database Systems`.
- When I provide official module names, use those names as the source of truth for course indexes and module maps.
- For Moodle-backed courses, follow [[Moodle Workflow]].
- Do not start or submit Moodle quiz attempts without explicit approval for that exact quiz.
- Do not leave processed raw files in `99 Inbox` after they have been classified or converted.
