---
type: lecture-note
year: 2
semester: 1
course_code: CSC 209
course_title: Database Systems
module: 1
source_files:
  - [[../../01 Source Materials/Module 01 - Introduction to Database Systems/CSC 209 - Module 01 - Introduction to Database Systems.pdf]]
tags:
  - source-backed
  - csc209
  - module-01
---

# Module 01 - Introduction to Database Systems

## Source
- [[../../01 Source Materials/Module 01 - Introduction to Database Systems/CSC 209 - Module 01 - Introduction to Database Systems.pdf]]

## Key Ideas
- A database system combines a collection of interrelated data with programs that let users access and modify that data.
- A DBMS is meant to provide an environment that is both convenient and efficient for managing large, valuable, shared data.
- Database systems are used when data is large, important, and accessed by many users or applications at the same time.
- A major purpose of a database system is to provide an abstract view of data so users do not deal directly with storage complexity.
- Early file-based systems had major weaknesses that database systems were designed to solve.

## Definitions
- `DBMS`: software used to store, organize, access, and manage data.
- `Data model`: a set of conceptual tools for describing data, relationships, semantics, and constraints.
- `Data abstraction`: hiding storage and implementation complexity from users.
- `Concurrent access`: multiple users or applications interacting with data at the same time.
- `Atomicity`: an update should either complete fully or not happen at all.

## Problems With File-Based Systems
- Data redundancy and inconsistency from storing the same information in multiple files.
- Difficulty accessing data because each new task may require a new program.
- Data isolation caused by different file formats and separate files.
- Integrity constraints becoming buried in code instead of being declared clearly.
- Partial failures causing inconsistent data if updates are not atomic.
- Concurrent access creating inconsistencies if multiple users update at the same time.
- Security controls being hard to enforce precisely.

## Database Application Areas Mentioned In The Source
- Enterprise systems such as sales, accounting, and human resources.
- Manufacturing, inventory, and supply chain management.
- Banking, finance, and credit card transactions.
- Universities for registration, grades, and transcripts.
- Airlines, telecommunications, navigation systems, and web-based services.

## What To Remember For Exam Use
- A DBMS exists because file systems do not scale well for large, shared, changing data.
- The strongest introductory justification for a DBMS is better control of redundancy, consistency, concurrency, security, and abstraction.
- If asked for examples, use familiar domains like banking, university registration, or e-commerce.

## Questions
- How many levels of data abstraction does your lecturer expect you to name in class notes or exams?
- Does this course want the database environment discussed together with DBMS users, administrators, and application programmers?
