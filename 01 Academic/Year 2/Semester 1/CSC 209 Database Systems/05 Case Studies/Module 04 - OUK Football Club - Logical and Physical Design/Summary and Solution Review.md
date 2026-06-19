# Summary and Solution Review

## Source Files
- [[Case Study Prompt - Module 04 - OUK Football Club.docx]]
- [[Solution - Module 04 - OUK Football Club Logical and Physical Design.docx]]

## Case Summary
- Task: construct logical design, then transform into physical design.

## What Was Done Well
- Solution identifies key entities (`Team`, `Player`, `Match`).
- It distinguishes logical from physical design.

## Where It Falls Short
- `Institution` and explicit captain constraint are missing.
- Fault records from the case are not modeled.
- Physical design should show datatypes, keys, and constraint intent more clearly.

## Improved Physical Design Additions
- Add `Institutions` table and `Institution_ID` as FK in `Teams`.
- Add `PlayerFaults` table for yellow/red cards.
- Add uniqueness/check constraints where possible (for example `Host_Team_ID <> Guest_Team_ID`).

## Status
- `Complete with gaps` (usable, but not fully aligned with all case requirements).
