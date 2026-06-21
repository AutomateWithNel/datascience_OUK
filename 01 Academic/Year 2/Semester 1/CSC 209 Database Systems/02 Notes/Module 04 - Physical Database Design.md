---
type: lecture-note
year: 2
semester: 1
course_code: CSC 209
course_title: Database Systems
module: 4
source_files:
  - [[../01 Source Materials/CSC 209 - Module 04 - Physical Database Design.pdf]]
  - [[../01 Source Materials/CSC 209 - Module 04 - Normalization.pdf]]
tags:
  - source-backed
  - csc209
  - module-04
---

# Module 04 - Physical Database Design

## Source
- [[../01 Source Materials/CSC 209 - Module 04 - Physical Database Design.pdf]]
- [[../01 Source Materials/CSC 209 - Module 04 - Normalization.pdf]]

## Key Ideas
- Physical database design translates the logical design into an implementable structure inside a specific DBMS.
- This module is concerned with how data is stored, indexed, partitioned, typed, backed up, and tuned for performance.
- Normalization is part of making the schema efficient and reducing anomalies before or alongside physical decisions.
- Good physical design supports performance, scalability, data integrity, cost control, and recovery.

## Core Physical Design Components
- Tables and files that map logical entities to actual stored structures.
- Indexes that speed up retrieval.
- Partitioning strategies for large tables or indexes.
- Appropriate data types to balance storage and correctness.
- Storage parameters and file organization.
- Backup, redundancy, and recovery planning.

## Development Steps From The Source
- Review the logical design first.
- Map entities and relationships to physical tables.
- Choose columns, keys, and data types.
- Implement constraints such as primary keys, foreign keys, `UNIQUE`, and `NOT NULL`.
- Design indexes based on common queries.
- Partition large data where needed.
- Decide file organization, storage, and performance tuning strategy.

## Normalization Points
- `1NF`: values must be atomic and repeating groups removed.
- `2NF`: non-key attributes must depend on the whole primary key.
- `3NF`: remove transitive dependencies between non-key attributes.
- Normalization reduces insertion, deletion, and update anomalies.

## Exam-Oriented Takeaways
- Logical design asks what the schema should be; physical design asks how it will be stored and accessed.
- Indexes and partitioning are performance tools, not replacements for a good schema.
- Normalization improves integrity and reduces redundancy before performance tuning decisions are layered on top.

## Questions
- Does your course treat normalization fully under Module 4 or separately in practice questions?
- Are you expected to compare clustered and non-clustered indexes in this course?
