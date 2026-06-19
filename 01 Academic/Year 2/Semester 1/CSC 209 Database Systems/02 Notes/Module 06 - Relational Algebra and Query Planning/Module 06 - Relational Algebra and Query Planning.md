---
type: lecture-note
year: 2
semester: 1
course_code: CSC 209
course_title: Database Systems
module: 6
source_files:
  - [[../../01 Source Materials/Module 06 - Relational Algebra and Query Planning/CSC 209 - Module 06 - SQL and Relational Algebra.pdf]]
tags:
  - source-backed
  - csc209
  - module-06
---

# Module 06 - Relational Algebra and Query Planning

## Source
- [[../../01 Source Materials/Module 06 - Relational Algebra and Query Planning/CSC 209 - Module 06 - SQL and Relational Algebra.pdf]]

## Query Planning Gap
- The current source explains the SQL-to-relational-algebra connection clearly, but does not go deep into execution plans or cost models.

## Key Ideas
- Relational algebra is the formal foundation of relational database querying.
- SQL implements many of the same ideas in a higher-level, practical language.
- Relational algebra is procedural, while SQL is declarative.
- Database engines translate SQL internally into algebra-like forms and use optimization rules to run queries efficiently.

## Important Operations
- Selection
- Projection
- Join
- Union
- Intersection

## SQL Vs Relational Algebra
- SQL is easier for users because it states the desired result.
- Relational algebra is better for expressing the underlying steps and theory.
- Classical relational algebra assumes sets without duplicates.
- SQL often works with bags or multisets unless `DISTINCT` is used.
- SQL supports `NULL`; classical relational algebra does not.

## Query Planning Link
- Query optimization depends on rewriting and ordering operations efficiently.
- Early filtering and join reordering are examples of optimization guided by algebraic rules.
- This module is the bridge between theory and the engine behavior behind SQL queries.

## Questions
- Does your course expect symbolic relational algebra expressions in addition to SQL examples?
- Will query planning include execution plans and cost-based optimization in tests, or only the conceptual link?
