---
type: assignment
course_code: CSC 209
module: 9
---

# Module 09 - Quiz Answers

**Source Reference**: `Module 09 - Data Warehousing and Business Intelligence.md` (and extracted image notes).

## 1. What are the most common data warehouse types?

**From my files**: According to the extracted course notes, data warehouses are classified by their purpose into three main types:
1. **Enterprise Data Warehouse (EDW):** A centralized warehouse providing decision support across the enterprise. It centralizes company-wide data in a structured format for analytics and reporting.
2. **Operational Data Store (ODS):** Used in place of a data warehouse or OLTP for reporting needs. It is refreshed in real-time, making it preferred for routine database functions and day-to-day data storage and retrieval.
3. **Data Mart:** An independent data warehouse that is a subset of the organizational data warehouse. It is created for specific organizational sections (like sales or finance), where data can be obtained directly from various sources.

## 2. What do you understand about data warehousing?

**From my files**: Based on the course materials, a data warehouse is a repository made of institutional information and data generated from internal operational systems and external sources. It is defined as a "subject-oriented, integrated, time-variant and non-volatile collection of data in support of management’s decision-making process" (Inmon, 1993). Its primary purpose is to support business decisions through data consolidation, analysis, and reporting at various aggregate levels.

## 3. What is the relationship between data warehousing and business intelligence?

**From my files**: A data warehouse consolidates raw data from various sources to support decision making. However, for that raw data to be useful, it must be transformed into meaningful patterns. **Business Intelligence (BI)** is the set of methods and tools used to transform this raw warehoused data into actionable insights to improve business processes. This includes data preparation, analytics, and visualization. In short, the data warehouse stores and prepares the data, while BI provides the tools (like Sisense or Tableau) to analyze and visualize it.

## 4. The difference and relationship between data mining and data warehousing

**From my files**: The course notes explain that Business Intelligence is an umbrella term used interchangeably with **Data Analytics** (which encompasses data mining techniques). 
- **Data Warehousing** is responsible for designing and creating the data storage from multiple sources, including data cleaning and preparation.
- **Data Analytics/Mining** is part of the BI process that involves transforming, analyzing, and visualizing this prepared data to find meaningful patterns.
- **Relationship**: Data warehousing provides the consolidated, cleaned, and integrated raw data, while data analytics/mining uses that data to generate actionable insights and visualizations.

**General explanation**: Data mining is the specific analytical process of exploring the large datasets stored in the data warehouse to uncover hidden patterns, correlations, and predictive trends. The data warehouse serves as the foundational storage that makes accurate data mining possible.
