# CSC 209 Module 08 Case Study Submission

## Case: OUK Football Club Database

### 1. Transactions likely to occur in the database

In the OUK football club database, the following are typical transactions:

1. Registering a new player and assigning the player to one team.
2. Recording a new match fixture with host team, guest team, date, and time.
3. Updating final match scores after a game.
4. Recording player fault events (for example yellow card or red card records).
5. Transferring a player from one team to another (where policy permits).

Each of these actions changes stored data and should be treated as a transaction to preserve correctness and traceability.

### 2. Scenario that violates ACID properties

A practical ACID violation scenario is when match-score updates are partially saved.

Assume a system is updating one match result:
- `Host_Score` is updated first.
- Before `Guest_Score` is updated, the system crashes.

This causes:
- **Atomicity violation**: only part of the transaction is completed.
- **Consistency risk**: the match row now holds an incomplete/incorrect result state.

To prevent this, both updates should run in one transaction block with commit/rollback control.

```sql
BEGIN TRANSACTION;

UPDATE Matches
SET Host_Score = 2
WHERE Match_ID = 901;

UPDATE Matches
SET Guest_Score = 1
WHERE Match_ID = 901;

COMMIT;
```

If any step fails, the transaction should be rolled back:

```sql
ROLLBACK;
```

This preserves ACID behavior and ensures the match result is either fully saved or not saved at all.

