# Summary and Solution Review

## Source Files
- [[Case Study Prompt - Module 02 - Tingwo Security Company.docx]]
- [[Submission - Module 02 - Tingwo Security Company.pdf]]

## Case Summary
- The task asks why the relational model is ideal for Tingwo's operations, and why a non-relational model might still be chosen.

## What Was Done Well
- The submission correctly mentions integrity, normalization, and SQL query/report strengths in relational systems.
- It gives valid reasons for non-relational preference: scalability, schema flexibility, and fast lookups.

## Where It Falls Short
- It can be stronger by tying each argument directly to Tingwo workflows (store approval, issuance logs, staff deployment, weekly reports).
- It should explicitly mention transaction-heavy operations as relational strengths.

## Improved Answer Points
- Relational is ideal for Tingwo because issuance and approvals are transaction-driven and require ACID guarantees.
- Referential integrity is critical for links between guards, zones, items, requisitions, approvals, and issuances.
- Non-relational may be preferred for high-volume telemetry like GPS/mobility logs and flexible document capture (photos, scanned receipts).

## Status
- `Complete` (good submission; improve with more case-specific examples).
