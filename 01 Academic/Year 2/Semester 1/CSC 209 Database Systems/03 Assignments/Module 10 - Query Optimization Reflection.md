---
type: assignment
course_code: CSC 209
module: 10
title: Query Optimization Reflection
---

# Module 10 - Query Optimization Reflection

## Reflection on Demonstrated Techniques

After reviewing the concepts and the presentation on the Query Optimizer (such as Bruce Momjian's breakdown of the PostgreSQL optimizer), it is clear that the query optimizer acts as the "brain" of the DBMS. The video effectively highlights that while SQL is a declarative language (we tell the database *what* we want, not *how* to get it), the database still has to translate our request into a highly specific execution plan. 

The optimizer primarily makes three core decisions that dictate query performance:
1. **Scan Method:** Deciding whether to read data row-by-row (Sequential Scan) or use an index (Index Scan/Bitmap Index Scan).
2. **Join Method:** Deciding how to combine tables, choosing between algorithms like Nested Loop, Hash Join, or Merge Join.
3. **Join Order:** Deciding the most efficient sequence in which to join multiple tables to minimize intermediate dataset sizes.

The most practical takeaway is the use of the `EXPLAIN` (or `EXPLAIN PLAN`) command. Instead of guessing why a query is slow, `EXPLAIN` allows developers to peek under the hood, see the estimated computational cost, and understand which scan or join methods the cost model selected.

## Application in Personal Work and Studies

In my own database work, especially when dealing with growing datasets like the OUK Football Club data warehouse, I can apply these techniques proactively:
- **Benchmarking with EXPLAIN:** Before deploying a complex query or view, I will use `EXPLAIN` to establish a baseline cost and ensure the DBMS isn't falling back on expensive sequential scans for large tables.
- **Selectivity (Retrieving Less Data):** I will stop using `SELECT *` out of habit and specifically target the columns I need, reducing memory usage and communication costs.
- **Indexing Strategies:** By understanding how the optimizer chooses scan methods, I can strategically apply B-Tree indexes on frequently filtered columns (like dates or foreign keys) to force the optimizer to choose an Index Scan over a Sequential Scan.

## Specific Example of Query Optimization

**Scenario:** I want to analyze recent severe disciplinary actions in the OUK Football Club database.

**Initial Unoptimized Query:**
```sql
SELECT * 
FROM player_faults 
WHERE card_type = 'Red' AND match_date >= '2025-01-01';
```

**Steps to Optimize:**

1. **Analyze Current Plan:** I would prepend `EXPLAIN` to the query. If the `player_faults` table is large, the optimizer will likely show a **Sequential Scan** (Seq Scan), meaning it is reading every single row in the table to find the red cards from 2025.
2. **Column Reduction:** I only need to know who got the card and when. I will replace `SELECT *` with `SELECT player_id, match_id, match_date`. This decreases memory usage cost and communication cost.
3. **Create Indexes:** I would create a composite index on the columns used in the `WHERE` clause:
   ```sql
   CREATE INDEX idx_faults_type_date ON player_faults(card_type, match_date);
   ```
4. **Re-evaluate:** I will run the `EXPLAIN` command again.

**Expected Improvements:**
The execution plan should now change from a **Sequential Scan** to an **Index Scan**. The optimizer’s cost estimate should drop significantly because the database can now traverse the B-Tree index to instantly locate the relevant rows, bypassing the need to read the entire table from secondary storage. This will transform a query that might take seconds on a massive dataset to one that executes in milliseconds.
