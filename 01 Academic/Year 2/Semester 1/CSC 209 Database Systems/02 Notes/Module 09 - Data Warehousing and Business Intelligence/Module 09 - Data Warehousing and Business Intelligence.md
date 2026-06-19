---
type: lecture-note
year: 2
semester: 1
course_code: CSC 209
course_title: Database Systems
module: 9
source_files:
  - [[../../01 Source Materials/Module 09 - Data Warehousing and Business Intelligence/CSC 209 - Module 09 - Data Warehousing and Business Intelligence.pdf]]
tags:
  - source-backed
  - csc209
  - module-09
---

# Module 09 - Data Warehousing and Business Intelligence

## Source
- [[../../01 Source Materials/Module 09 - Data Warehousing and Business Intelligence/CSC 209 - Module 09 - Data Warehousing and Business Intelligence.pdf]]

## Key Ideas
- A data warehouse is a centralized repository that stores integrated data from multiple sources for analysis and reporting.
- Data warehousing supports decision-making by providing current, historical, and sometimes predictive views of operations.
- Business intelligence focuses on analyzing that data and turning it into insights, dashboards, and decisions.
- Data warehousing and BI are related but not identical: the warehouse stores and prepares data, while BI interprets it.

## Data Warehouse Characteristics
- Subject-oriented
- Integrated
- Non-volatile
- Time-variant

## Architecture Components
- ETL tools
- Staging area
- Data warehouse database
- Data marts
- OLAP tools

## DW Vs BI
- Data warehousing is about storage, integration, and management.
- Business intelligence is about analysis, reporting, KPIs, and decision support.
- BI depends on good warehouse data for quality insights.

## Importance
- Supports informed decision-making.
- Enables trend analysis and forecasting.
- Consolidates data from multiple systems.
- Improves reporting consistency and analytical capability.

## Questions
- Does your course also cover OLTP vs OLAP explicitly in this module?
- Are star schema and snowflake schema part of your expected data warehousing scope?

## Extracted Image Notes

**INTRODUCTION TO DATA WAREHOUSING**

Data warehousing as we knew in the yester years has changed. Our data sources are now diverse, data processing tools are changing and the amount of data being generated and handled is growing at an imaginable rate. To cope with these changes, data warehousing and data analytics have become an all-time important concept in databases. In this section, you will learn about the definition of data warehousing and techniques used to create and use data warehouses. The data sources are diverse and come even from unknown sources. This data come in different forms and have no clear meaning unless and the data they are sifted for meaningful information.

**WHAT IS A DATA WAREHOUSE?**

A data warehouse (DW) is made of any institutional information and data generated from internal operational systems and external data sources. As put by Inmon (1993), ‘A data warehouse is a subject-oriented, integrated, time-variant and non-volatile collection of data in support of management’s decision-making process’ (Inmon 1993). The primary purpose of a data warehouse is to support business decisions by allowing data consolidation, analysis, and reporting at different aggregate levels. The process of populating a data warehouse involved data extraction, transformation, and loading.

**IMPORTANCE OF DATA WAREHOUSING**

In the present day data world, data is money. Keeping a functional and well organized data warehouse can keep a company ahead of its competitors by allowing them to think way ahead of others in product development, marketing, pricing strategy, production time, historical analysis, and forecasting and customer satisfaction.

Data warehouse building and maintenance is not cheap. However, it has been shown to give an edge to companies.

**DATA WAREHOUSING TYPES**

Data warehouses are classified according to their purpose. There are three main types of data warehouses, namely Enterprise Data Warehouse, Operational Data Store and Data Mart.

- **Enterprise Data Warehouse (EDW):** This is a centralized warehouse, which provides decision support service across the enterprise. EDW centralizes company-wide data in a highly structured format ready for analytics querying and reporting. It provides a way to classify data according to the subject.
- **Operational Data Store (ODS):** is used in place of Data warehouse or OLTP to support organizations reporting needs. When using an ODS, Data warehouse is refreshed in real time and hence preferred for routine database functions such as organizations data storage and retrieval on a day to day basis.
- **Data Mart:** As an independent data warehouse, a Data Mart is a subset of organizational data warehouse. It is created for specific organizational sections such as sales, finance, sales, or finance. In an independent data mart, data and information can be obtained directly from various sources.

**DATA WAREHOUSING AND BUSINESS INTELLIGENCE**

You now know that a data warehouse is made up of consolidated data and information from various sources. Its key importance is to support strategic and tactical decision making. For a DW to be useful, the raw data in it must be transformed into meaningful patterns for actionable insights. The set of methods and tools used to transform these data sets into meaningful patterns is called business intelligence (BI). BI describes a set of tools and methods that transform raw data into meaningful patterns for actionable insights and improving business processes. This usually includes data preparation, data analytics, and data visualization.

In general terms, BI tools are used to transform raw data into meaningful information. Besides transformation, the same tools are used to analyze and visualize data. However, various BI tools have different capabilities. While others provide an end to end solution to the BI processes, others can only be used for transformation, analytics or visualization. Example tools include Sisense, python R, among other BI Analytics & Dashboard Software.

In summary, we can say that Business Intelligence is an umbrella term used interchangeably with Data Analytics. It basically describes the process of data preparation, data analysis, and visualization. Data is responsible for designing and creating data and information storage from more than one source. It can also include data cleaning and preparation for analysis.

According to digitalvidya.com, the top 20 Intelligence tools in the market includes:

- Sisense, Tableau, Domo, Looker, Chartio, Qlik Sense, Google Analytics, SAP Crystal Reports, Microsoft Power BI, Microsoft SharePoint, Oracle BI, BIRT, Clear Analytics, Pentaho BI, Jaspersoft, BIME, Adaptive Suite, Knime, SpagoBI, ClicData.
