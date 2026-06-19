---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: 3
source_files:
  - [[../../01 Source Materials/Module 03 - Data Loading and File Formats in Pandas/DSC 201 - Module 03 - Data Loading and File Formats in Pandas.html]]
  - [[../../01 Source Materials/Module 03 - Data Loading and File Formats in Pandas/DSC 201 - Module 03 - Data Loading and File Formats in Pandas.txt]]
tags:
  - source-backed
  - dsc201
  - module-03
  - pandas
  - data-loading
---

# Module 03 - Data Loading and File Formats in Pandas

## Source
- [[../../01 Source Materials/Module 03 - Data Loading and File Formats in Pandas/DSC 201 - Module 03 - Data Loading and File Formats in Pandas.html]]
- [[../../01 Source Materials/Module 03 - Data Loading and File Formats in Pandas/DSC 201 - Module 03 - Data Loading and File Formats in Pandas.txt]]

## Learning Outcomes
By the end of this module, you should be able to:
1. Identify common text formats that Pandas can read from and write to, such as CSV and JSON.
2. Demonstrate how to read and write binary file formats.
3. Construct a workflow that retrieves data from a web API, SQL, and NoSQL, processes it using Pandas, and saves the result to a database.
4. Present data collected from different file formats in a Pandas DataFrame.

## Key Ideas
- Data science work often requires loading data from different file formats before analysis can begin.
- Pandas supports reading and writing text formats, binary formats, web API data, and database data.
- The main goal is to get external data into a Pandas DataFrame so it can be cleaned, inspected, analyzed, and saved.
- File loading functions usually require a file path and may also accept options for sheet names, headers, selected columns, or formatting.

## Reading and Writing Excel Files
- Use `pd.read_excel()` to read an Excel file.
- Common parameters include:
  - `io` or file path: where the Excel file is located.
  - `sheet_name`: the worksheet to read.
  - `header`: the row to use as column names.
  - `usecols`: the specific columns to load.

```python
import pandas as pd

df = pd.read_excel(
    "Admission_Predict.xlsx",
    sheet_name="Admission_Predict",
    header=0
)

df.head()
```

- Use `to_excel()` to save a DataFrame as an Excel file.
- Useful parameters include:
  - `excel_writer`: output file path or writer object.
  - `sheet_name`: name of the sheet to write.
  - `float_format`: format for decimal values.
  - `header`: whether to write column names.
  - `index`: whether to write the DataFrame index.

```python
df.to_excel(
    "testing.xlsx",
    index=False,
    sheet_name="data",
    float_format="%.2f"
)
```

## Reading JSON Files
- Pandas provides `read_json()` for loading JSON data.
- JSON is common in web applications and APIs.

```python
df = pd.read_json("data.json")
```

## HDF5 Files
- HDF5 means Hierarchical Data Format version 5.
- It is used for storing and managing large, complex datasets.
- HDF5 organizes data in a hierarchy, similar to a file system.
- It is useful in scientific and data-intensive fields because it is scalable, portable, and efficient.
- Pandas provides `read_hdf()` for reading HDF5 files.

```python
df = pd.read_hdf("data.h5")
```

## Web APIs
- API means Application Programming Interface.
- Web APIs allow applications to exchange machine-readable data over the web.
- Common API styles include:
  - `REST`: uses HTTP methods such as GET, POST, PUT, and DELETE. Often returns JSON or XML.
  - `SOAP`: exchanges structured information using XML.
  - `GraphQL`: allows the client to request exactly the data needed.

The source demonstrates retrieving weather data from a web API, converting the response to JSON, and extracting values into Python. Use placeholders for API keys in study code:

```python
import requests

api_key = "YOUR_API_KEY"
base_url = "https://api.openweathermap.org/data/2.5/weather"

params = {
    "lat": 1.2921,
    "lon": 36.8219,
    "units": "metric",
    "appid": api_key,
}

response = requests.get(base_url, params=params)

if response.status_code == 200:
    weather_data = response.json()
    current_temp = weather_data["main"]["temp"]
    print(current_temp)
else:
    print(response.status_code)
```

## Databases
- Pandas can read from databases after a connection is created.
- The module demonstrates MySQL access using SQLAlchemy.
- Database connection details normally include host, database name, user, and password.
- Use placeholders for credentials in notes and assignments.

```python
import pandas as pd
from sqlalchemy import create_engine

host = "HOST"
database = "DATABASE"
user = "USERNAME"
password = "PASSWORD"

engine = create_engine(
    f"mysql+mysqlconnector://{user}:{password}@{host}/{database}"
)
```

## Binary Data Files
- Binary formats store data compactly and can preserve data types.
- The module mentions Pickle, HDF5, and Parquet.

## Pickle
- Pickle is a Python-specific binary format.
- Use `to_pickle()` to save a DataFrame.
- Use `read_pickle()` to load it back.

```python
df.to_pickle("data.pkl")

df = pd.read_pickle("data.pkl")
```

## Parquet
- Parquet is a columnar storage format optimized for large datasets.
- It is commonly used in big data workflows.
- Use `read_parquet()` to load Parquet files.
- Use `to_parquet()` to save data in Parquet format.

```python
df = pd.read_parquet("yellow_tripdata_2023-01.parquet")
df.head()

df.to_parquet("output.parquet")
```

## What To Remember For Exam Use
- Use `pd.read_excel()` for Excel files.
- Use `to_excel()` to save a DataFrame to Excel.
- Use `pd.read_json()` for JSON files.
- Use `pd.read_hdf()` for HDF5 files.
- Use `requests.get()` to retrieve data from a REST API.
- Use `response.json()` when the API response is JSON.
- Use SQLAlchemy to create a database connection before reading database data into Pandas.
- Use `to_pickle()` and `read_pickle()` for Pickle files.
- Use `read_parquet()` and `to_parquet()` for Parquet files.

## Questions
- Will the Module 3 practical task require API/database code, or only file loading with Pandas?
- Does the quiz expect exact function names only, or full code snippets with imports and file paths?
