# Summary and Solution Review

## Source Files
- [[Case Study Details - Module 08 - OUK Football Club Transactions and ACID.docx]]

## Case Summary
- Task 1: discuss transactions in the OUK football database.
- Task 2: give at least one scenario that violates ACID.

## Suggested Solution

### Likely Transactions
- Registering a new player and assigning them to a team.
- Recording a match fixture with host and guest teams.
- Updating match scores after full time.
- Recording yellow/red card faults for players.
- Transferring a player from one team to another (if allowed by rules).

### ACID Violation Scenario
- A score update transaction writes `Host_Score` but fails before writing `Guest_Score`.
- This breaks `Atomicity` because only part of the transaction is committed.
- It also threatens `Consistency` if business rules require both scores updated together.
- Proper fix: wrap both updates in one transaction with commit/rollback.

```sql
BEGIN TRANSACTION;
UPDATE Matches SET Host_Score = 2 WHERE Match_ID = 901;
UPDATE Matches SET Guest_Score = 1 WHERE Match_ID = 901;
COMMIT;
```

If any statement fails:

```sql
ROLLBACK;
```

## Status
- `Pending submission` (prompt exists; this note contains a complete draft answer).
