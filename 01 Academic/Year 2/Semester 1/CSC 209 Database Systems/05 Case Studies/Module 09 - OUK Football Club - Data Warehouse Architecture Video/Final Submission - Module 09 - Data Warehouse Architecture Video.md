# CSC 209 Module 09 Case Study Submission

## Case: OUK Football Club Data Warehouse Architecture

### Assessment Path Chosen

I completed the task through a practical skill demonstration by recording a video and uploading it to the E-Portfolio.

### Activity Completed

In the video, I drew and explained a conceptual architecture for a data warehouse for the OUK football club. The design focused on how operational data can be integrated, cleaned, stored, and used for reporting and decision-making.

### Conceptual Architecture Presented

1. Data Sources
- Match records (fixtures, scores, hosts, guests).
- Team records (team details, coaches, institutions).
- Player records (profiles, skill levels, team assignments).
- Player discipline records (yellow/red cards).

2. Data Integration Layer (ETL)
- Extract data from operational databases.
- Transform to standard formats and resolve inconsistencies.
- Load cleansed data into warehouse structures.

3. Central Data Warehouse Storage
- Fact tables for measurable events (for example match results).
- Dimension tables for descriptive context (players, teams, dates, institutions).
- Historical storage to support trend analysis across seasons.

4. Analytics and Reporting Layer
- Dashboards for team performance.
- Player performance and discipline analysis.
- Match trend reports (home vs away outcomes, scoring patterns).
- Management summaries for strategic decisions.

### Value to OUK Football Club

The architecture enables integrated reporting, historical analysis, and evidence-based decision-making for technical and management teams.

### Submission Evidence

- Video recorded and uploaded to E-Portfolio as required.
- The video demonstrates the conceptual drawing and explanation of each architecture layer.

### Exercise Questions and Responses

**1. Do you think it will be necessary at some point to create a data warehouse? Why?**
Yes, as the OUK football club and the national football competition grow, it will become necessary to create a data warehouse. Operational systems are designed for day-to-day transactions (e.g., recording match scores or assigning red cards) but not for long-term strategic analysis. A data warehouse provides a centralized, subject-oriented, and integrated repository for all this data. By storing historical, non-volatile data across multiple seasons (making it time-variant), it allows the technical team to analyze long-term trends and make informed decisions without slowing down the operational databases.

**2. Why would it be necessary to get extra data/information from external sources for the football club data warehouse?**
Integrating external data enriches the club's analytical capabilities. For example, the club might pull in data regarding opponent team statistics, weather conditions during matches, or player injury reports from external medical providers. By bringing this external information into the staging area and combining it with internal data via ETL processes, the data warehouse can provide a much more comprehensive view. This deeper integration allows the club to understand external factors affecting performance and better prepare strategic responses.

**3. What kind of business intelligence can be done for the OUK football club? Why?**
Business intelligence (BI) for the OUK football club would focus on turning the warehoused data into actionable insights through dashboards and reporting. For example:
- **Player Performance & Discipline Analysis:** Tracking yellow and red card patterns alongside player skill classifications to optimize training and discipline strategies.
- **Match Trend Analysis:** Analyzing home (host) versus away (guest) performance trends to adjust game tactics.
- **Strategic Decision Support:** Providing the coach and management with KPIs and visualizations that forecast team performance and help determine optimal team lineups.
This BI is crucial because it transforms raw, integrated data into strategic knowledge, ultimately improving the club's competitive advantage.
