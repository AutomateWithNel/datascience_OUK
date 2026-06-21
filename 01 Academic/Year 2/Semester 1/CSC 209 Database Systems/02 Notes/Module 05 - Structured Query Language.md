---
type: lecture-note
year: 2
semester: 1
course_code: CSC 209
course_title: Database Systems
module: 5
source_files:
  - [[../01 Source Materials/CSC 209 - Module 07 - Database Programming Notes.pdf]]
  - [[../01 Source Materials/CSC 209 - Module 02 - Relational Model and Languages.pdf]]
tags:
  - source-backed
  - csc209
  - module-05
---

# Module 05 - Structured Query Language

## Source
- [[../01 Source Materials/CSC 209 - Module 07 - Database Programming Notes.pdf]]
- [[../01 Source Materials/CSC 209 - Module 02 - Relational Model and Languages.pdf]]

## Key Ideas
- SQL is the standard language used to interact with relational databases.
- The practical notes cover the main data operations: `SELECT`, `INSERT INTO`, `UPDATE`, and `DELETE`.
- SQL is declarative: you specify what result you want rather than the exact execution steps.
- SQL works with relational concepts such as tables, primary keys, foreign keys, and joins.

## Common SQL Operations
- `SELECT`: retrieve data.
- `INSERT INTO`: add new rows.
- `UPDATE`: modify existing rows.
- `DELETE`: remove rows.
- `WHERE`: filter rows.
- `ORDER BY`: sort output.
- `LIMIT`: restrict number of returned rows.

## SQL Data Types Mentioned
- Text types such as `VARCHAR`, `CHAR`, and `TEXT`.
- Numeric types such as `INT`, `FLOAT`, and `DECIMAL`.
- Date and time types such as `DATE`, `TIME`, and `TIMESTAMP`.

## Join Basics
- `INNER JOIN` returns matching records from both tables.
- `LEFT JOIN` returns all rows from the left table and matching rows from the right.
- `RIGHT JOIN` returns all rows from the right table and matching rows from the left.
- `FULL OUTER JOIN` returns matches plus unmatched rows from both sides.

## Connection To Later Modules
- Module 6 explains the theoretical basis behind SQL operations using relational algebra.
- Module 7 shows SQL in use inside database programming and data retrieval tasks.

## Questions
- Does your lecturer want DDL topics like `CREATE`, `ALTER`, and `DROP` emphasized here or in a later practical unit?
- Are aggregate functions, grouping, and subqueries already part of your assessed SQL scope?
