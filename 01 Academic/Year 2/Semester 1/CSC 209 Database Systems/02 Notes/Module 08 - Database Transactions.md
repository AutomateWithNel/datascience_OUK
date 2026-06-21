---
type: lecture-note
year: 2
semester: 1
course_code: CSC 209
course_title: Database Systems
module: 8
source_files:
  - [[../01 Source Materials/CSC 209 - Module 08 - Database Transactions.pdf]]
tags:
  - source-backed
  - csc209
  - module-08
---

# Module 08 - Database Transactions

## Source
- [[../01 Source Materials/CSC 209 - Module 08 - Database Transactions.pdf]]

## Key Ideas
- A transaction is a logical unit of work containing one or more SQL statements executed as one unit.
- A transaction should either complete fully or fail fully; partial completion is not acceptable.
- Transactions are managed using commit, rollback, savepoints, and concurrency controls.
- Reliable transaction processing is defined by the ACID properties.

## ACID Properties
- `Atomicity`: all operations succeed or all fail.
- `Consistency`: a transaction moves the database from one valid state to another.
- `Isolation`: concurrent transactions should not interfere with each other.
- `Durability`: committed changes remain permanent.

## Transaction Control Terms
- `Commit`: make changes permanent.
- `Rollback`: undo uncommitted changes.
- `Savepoint`: create a partial rollback marker within a transaction.
- `Concurrency`: multiple transactions execute at the same time.
- `Deadlock`: transactions wait indefinitely for one another's locks.

## Transaction Process
1. Begin transaction.
2. Execute SQL operations.
3. Check for errors or violations.
4. Commit if successful, or rollback if not.
5. End transaction.

## Why This Module Matters
- It protects data integrity during failures.
- It prevents inconsistent shared updates in multi-user systems.
- It is essential for banking, finance, inventory, registration, and any system with important state changes.

## Questions
- Does your lecturer expect transaction states like active, partially committed, failed, aborted, and committed to be named explicitly?
- Will locking and isolation levels be examined in detail in this course?
