---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: 4
source_files:
  - [[../../01 Source Materials/Module 04 - Data Cleaning and Preparation/DSC 201 - Module 04 - Data Cleaning and Preparation.html]]
  - [[../../01 Source Materials/Module 04 - Data Cleaning and Preparation/DSC 201 - Module 04 - Data Cleaning and Preparation.txt]]
tags:
  - source-backed
  - dsc201
  - module-04
  - pandas
  - data-cleaning
---

# Module 04 - Data Cleaning and Preparation

## Source
- [[../../01 Source Materials/Module 04 - Data Cleaning and Preparation/DSC 201 - Module 04 - Data Cleaning and Preparation.html]]
- [[../../01 Source Materials/Module 04 - Data Cleaning and Preparation/DSC 201 - Module 04 - Data Cleaning and Preparation.txt]]

## Learning Outcomes
By the end of this module, you should be able to:
1. Recall methods for identifying and handling missing data in Pandas.
2. Explain data transformation using Pandas functions.
3. Apply data cleaning and preparation techniques to real-world datasets.
4. Analyze the effectiveness of cleaning techniques in improving data quality.

## Key Ideas
- Data cleaning makes datasets accurate, consistent, and complete before analysis.
- Cleaning and preparation are usually early tasks in a data science project.
- Common cleaning tasks include loading data, cleaning missing values, transforming data, rearranging data, removing duplicates, and replacing values.
- Clean data improves analysis quality and can improve machine learning performance.

## Why Data Cleaning Is Necessary
- Data may not be in the right format for analysis.
- Data can contain missing values or duplicate records.
- Data may need to conform to a required range or structure.
- Data from multiple sources may need to be merged and made consistent.

## Checking for Missing Data
Use `isnull()` to check whether values are missing.

```python
import pandas as pd

data = pd.read_csv("brittleness-index.csv")
data.isnull()
```

The result contains:
- `False`: value is present.
- `True`: value is missing.

Use `isnull().sum()` to count missing values per column.

```python
data.isnull().sum()
```

Example output from the notes:

```text
TK104    3
TK105    2
TK107    0
dtype: int64
```

Use `info()` to inspect the number of non-null values in each column.

```python
data.info()
```

## Handling Missing Data with `dropna()`
Use `dropna()` to remove rows or columns that contain missing values.

```python
new_data = data.dropna(axis=0, inplace=False)
new_data.isnull().sum()
```

Important parameters:
- `axis=0`: drop rows with missing values.
- `axis=1`: drop columns with missing values.
- `how="any"`: drop when any value is missing.
- `how="all"`: drop only when all values are missing.
- `inplace=True`: modify the original DataFrame.
- `inplace=False`: return a cleaned copy.

After dropping rows with missing values, the dataset can become smaller. In the notes example, the dataset reduced from 23 entries to 18 entries.

## Handling Missing Data with `fillna()`
Use `fillna()` to replace missing values with a chosen value.

```python
new_data = data.fillna(value=10, limit=2)
new_data.head()
```

Important parameters:
- `value`: replacement value.
- `method`: method used to fill missing values.
- `axis`: row or column direction.
- `inplace`: whether to modify the original DataFrame.
- `limit`: maximum number of consecutive missing values to fill.

Common filling methods:
- `bfill` or `backfill`: use the next valid observation.
- `ffill`: use the previous valid observation and carry it forward.

Missing values can also be filled with summary statistics such as mean, median, or mode.

```python
data_fillmean = data.fillna(value=data["TK105"].mean())
data_fillmean.head()
```

## Transforming Data
Data transformation prepares data into a required format for analysis.

Common transformation tasks include:
- renaming columns,
- aggregating data,
- converting categories,
- replacing values,
- removing duplicate records.

## Removing Duplicates
Use `drop_duplicates()` to remove duplicate records.

```python
data_duplicates = pd.DataFrame({
    "brand": ["Potatoes", "Potatoes", "Rice", "Rice", "Rice"],
    "style": ["basket", "basket", "basket", "pack", "pack"],
    "rating": [4, 4, 3.5, 15, 5]
})

data_duplicates.drop_duplicates()
```

Important parameters:
- `subset`: columns to consider when identifying duplicates.
- `keep="first"`: keep the first occurrence.
- `keep="last"`: keep the last occurrence.
- `keep=False`: remove all duplicate occurrences.
- `inplace`: whether to modify the original DataFrame.
- `ignore_index`: whether to reset the index.

Drop duplicates based on one column:

```python
data_duplicates.drop_duplicates(subset=["brand"])
```

Keep the last duplicate:

```python
data_duplicates.drop_duplicates(subset=["brand"], keep="last")
```

Use `duplicated()` to check whether rows are duplicates.

```python
data_duplicates.duplicated()
```

## Replacing Values
Use `replace()` when specific values need to be changed.

```python
data = pd.DataFrame({
    "A": [0, 1, 2, 3, 4],
    "B": [5, 6, 7, 8, 9],
    "C": ["a", "b", "c", "d", "e"]
})

data.replace(0, 5)
```

This replaces `0` with `5`.

## Exam Reminders
- Use `isnull().sum()` to count missing values.
- Use `info()` to inspect non-null counts and data types.
- Use `dropna()` to remove missing values.
- Use `fillna()` to replace missing values.
- Use `ffill` to fill missing values with the previous valid value.
- Use `drop_duplicates()` to remove duplicate rows.
- Use `duplicated()` to detect duplicates.
- Use `replace()` to change specific values.

