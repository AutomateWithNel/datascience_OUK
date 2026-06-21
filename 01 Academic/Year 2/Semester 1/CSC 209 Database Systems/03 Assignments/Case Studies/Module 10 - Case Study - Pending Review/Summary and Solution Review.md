# Summary and Solution Review

## Source Files
- [[Case Study Details - Module 10 - OUK Football Club Query Optimization.pdf]]

## Case Summary
- Task: show a query for OUK-only scale and an improved version for a larger national-scale database.

## Suggested Solution

### 1. OUK-Only Style Query (small dataset)
- Works, but scans broader data than necessary.

```sql
SELECT
  p.Player_Name,
  t.Team_Name,
  m.Match_Date,
  m.Host_Score,
  m.Guest_Score
FROM Players p
JOIN Teams t ON p.Team_ID = t.Team_ID
JOIN Matches m ON (m.Host_Team_ID = t.Team_ID OR m.Guest_Team_ID = t.Team_ID)
WHERE t.Team_Name = 'OUK FC';
```

### 2. Improved Query for National Database (large dataset)
- Filter early using a small OUK team set.
- Avoid broad OR join conditions where possible.

```sql
WITH ouk_team AS (
  SELECT Team_ID
  FROM Teams
  WHERE Team_Name = 'OUK FC'
)
SELECT
  p.Player_Name,
  t.Team_Name,
  m.Match_Date,
  m.Host_Score,
  m.Guest_Score
FROM ouk_team o
JOIN Players p ON p.Team_ID = o.Team_ID
JOIN Teams t ON t.Team_ID = p.Team_ID
JOIN Matches m ON m.Host_Team_ID = o.Team_ID OR m.Guest_Team_ID = o.Team_ID
WHERE m.Match_Date >= DATE '2024-01-01';
```

### 3. Indexing Strategy for Optimization
- `CREATE INDEX idx_teams_name ON Teams(Team_Name);`
- `CREATE INDEX idx_players_team ON Players(Team_ID);`
- `CREATE INDEX idx_matches_host ON Matches(Host_Team_ID);`
- `CREATE INDEX idx_matches_guest ON Matches(Guest_Team_ID);`
- `CREATE INDEX idx_matches_date ON Matches(Match_Date);`

### 4. Why This Is Better at National Scale
- Reduces rows processed before heavy joins.
- Improves index usage for team lookup and match filtering.
- Keeps query response stable as number of teams/players/matches grows.

## Status
- `Pending submission` (prompt exists; this note contains a complete draft answer).
