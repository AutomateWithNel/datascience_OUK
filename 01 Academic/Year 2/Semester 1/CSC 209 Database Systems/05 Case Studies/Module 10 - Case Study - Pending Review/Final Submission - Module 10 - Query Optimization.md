# CSC 209 Module 10 Case Study Submission

## Case: OUK Football Club Database Elevated to National Scale

The task requires a query example for:
1. OUK-only database context.
2. Improved query approach for a larger national database.

## 1) Query style suitable for OUK-only scale

For a small dataset, a direct join pattern is acceptable:

```sql
SELECT
  p.Player_Name,
  t.Team_Name,
  m.Match_Date,
  m.Host_Score,
  m.Guest_Score
FROM Players p
JOIN Teams t
  ON p.Team_ID = t.Team_ID
JOIN Matches m
  ON (m.Host_Team_ID = t.Team_ID OR m.Guest_Team_ID = t.Team_ID)
WHERE t.Team_Name = 'OUK FC';
```

This works for a small OUK-focused database, but it becomes slower as the number of teams, players, and matches increases nationally.

## 2) Improved query for national-scale database

For a larger database, performance improves by filtering early and reducing rows before expensive joins.

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
JOIN Players p
  ON p.Team_ID = o.Team_ID
JOIN Teams t
  ON t.Team_ID = p.Team_ID
JOIN Matches m
  ON (m.Host_Team_ID = o.Team_ID OR m.Guest_Team_ID = o.Team_ID)
WHERE m.Match_Date >= DATE '2024-01-01';
```

## 3) Supporting indexes for optimization

To support the improved query pattern, create indexes on frequent filter/join columns:

```sql
CREATE INDEX idx_teams_name ON Teams(Team_Name);
CREATE INDEX idx_players_team ON Players(Team_ID);
CREATE INDEX idx_matches_host ON Matches(Host_Team_ID);
CREATE INDEX idx_matches_guest ON Matches(Guest_Team_ID);
CREATE INDEX idx_matches_date ON Matches(Match_Date);
```

## 4) Why the second approach is better at national scale

1. It filters to OUK team rows first, reducing the join search space.
2. It improves index utilization for team lookup and match filtering.
3. It maintains faster query response as data volume grows across many institutions and teams.

