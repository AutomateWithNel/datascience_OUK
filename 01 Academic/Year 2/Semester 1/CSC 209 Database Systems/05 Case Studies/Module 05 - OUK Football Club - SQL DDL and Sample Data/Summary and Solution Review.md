# Summary and Solution Review

## Source Files
- [[Case Study Prompt - Module 05 - OUK Football Club SQL DDL.docx]]
- [[Solution - Module 05 - OUK Football Club SQL DDL and DML.docx]]

## Case Summary
- Task: using earlier ER design, create at least three tables and insert sample data.

## What Was Done Well
- Three core tables are created (`Teams`, `Players`, `Matches`).
- Primary and foreign keys are included.
- Sample inserts are provided.

## Where It Falls Short
- Naming is consistent but constraints are light (nullable columns, no checks).
- Case-specific features like cards/fault records and institution ownership are missing.

## Suggested Improvements
- Add `NOT NULL` on critical columns.
- Add `CHECK (Host_Team_ID <> Guest_Team_ID)`.
- Add `Institutions` and `PlayerFaults` tables if lecturer expects full case coverage.

## Status
- `Complete` (strong for a minimum three-table submission).
