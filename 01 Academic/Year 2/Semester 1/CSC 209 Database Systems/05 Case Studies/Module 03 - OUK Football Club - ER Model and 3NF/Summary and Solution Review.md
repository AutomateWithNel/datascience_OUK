# Summary and Solution Review

## Source Files
- [[Case Study Prompt - Module 03 - OUK Football Club ER Model.docx]]
- [[Solution - Module 03 - OUK Football Club ER Model and 3NF.docx]]

## Case Summary
- Tasks: construct ER diagram, create relation with at least 4 columns, identify primary key, normalize to 3NF.

## What Was Done Well
- The solution identifies a starting relation and primary key.
- It explains transitive dependency and splits into `Players` and `Teams`.
- It gives a reasonable 3NF direction.

## Where It Falls Short
- It does not fully show the ER diagram artifacts in text form.
- The wider case needs more entities: `Institution`, `Match`, and possibly `FaultRecord`.
- 3NF demonstration should include final keys and foreign-key constraints explicitly.

## Improved Final Structure Suggestion
- `Institutions(Institution_ID PK, Institution_Name)`
- `Teams(Team_ID PK, Team_Name, Coach_Name, Institution_ID FK, Captain_Player_ID FK)`
- `Players(Player_ID PK, Player_Name, Skill_Level, Team_ID FK)`
- `Matches(Match_ID PK, Match_Date, Match_Time, Host_Team_ID FK, Guest_Team_ID FK, Host_Score, Guest_Score)`
- `PlayerFaults(Fault_ID PK, Player_ID FK, Card_Type, Fault_Date, Match_ID FK)`

## Status
- `Partially complete` (core idea is correct; needs fuller ER and normalized schema coverage).
