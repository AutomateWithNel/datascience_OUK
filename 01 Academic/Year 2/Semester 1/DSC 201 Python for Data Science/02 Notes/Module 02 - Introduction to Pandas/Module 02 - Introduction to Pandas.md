---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: 2
source_files:
  - [[../../01 Source Materials/Module 02 - Introduction to Pandas/DSC 201 - Module 02 - Introduction to Pandas.txt]]
  - [[../../01 Source Materials/Module 02 - Introduction to Pandas/Student_Performance.csv]]
  - [[../../01 Source Materials/Module 02 - Introduction to Pandas/Admission_Predict.xlsx]]
tags:
  - source-backed
  - dsc201
  - module-02
  - pandas
---

# Module 02 - Introduction to Pandas

## Source
- [[../../01 Source Materials/Module 02 - Introduction to Pandas/DSC 201 - Module 02 - Introduction to Pandas.txt]]
- [[../../01 Source Materials/Module 02 - Introduction to Pandas/Student_Performance.csv]]
- [[../../01 Source Materials/Module 02 - Introduction to Pandas/Admission_Predict.xlsx]]

## Learning Outcomes
By the end of this module, you should be able to:
1. Describe the primary data structures in Pandas.
2. Explain reindexing, dropping entries, selection and filtering, sorting, and ranking.
3. Apply Pandas functions to reindex a DataFrame, drop entries, and filter data.
4. Analyze a dataset using descriptive statistics such as mean, median, and standard deviation.

## Key Ideas
- Pandas is a Python library used for data analysis.
- Pandas stands for panel data.
- Pandas presents data in a table-like form, similar to Excel.
- The two main Pandas data structures covered are `Series` and `DataFrame`.
- Use `pip install pandas` to install Pandas if it is not already installed.
- Use `import pandas as pd` to import Pandas with the common alias `pd`.

## Series
- A `Series` is a one-dimensional array-like structure.
- It can hold Python data types and has axis labels used as indexes.
- A Series can be created from a list, dictionary, NumPy array, or scalar value.

```python
import pandas as pd

data = [34, 56, 77, 89, 34, 25, 67, 89, 86, 12, 59, 87]
series_data = pd.Series(data)
```

```python
dic = {"A": 23, "b": 40, "c": 67, "d": 23}
dic_series = pd.Series(dic)
print(dic_series)
```

## Series Attributes
- `index`: shows the index labels.
- `values`: returns the values in the Series.
- `dtype`: shows the data type.
- `shape`: shows the shape of the Series.
- `ndim`: shows the number of dimensions.
- `empty`: checks whether the Series is empty.

## Accessing Series Elements
- Use the index label to access a value:

```python
dic_series["A"]
```

- Use numeric slicing to access a range:

```python
dic_series[0:4]
```

## DataFrames
- A `DataFrame` is a two-dimensional data structure arranged in rows and columns.
- DataFrames look like tables.
- A DataFrame can be created from dictionaries, NumPy arrays, existing data structures, or files.

```python
dicti = {"a": [40, 40], "b": [56, 89], "c": [34, 56], "d": [66, 77]}
data = pd.DataFrame(data=dicti)
print(data)
```

## Reading Files
- `pd.read_csv()` reads CSV files.
- `pd.read_excel()` reads Excel files.

```python
import pandas as pd

data = pd.read_csv("Student_Performance.csv")
```

## Exploring DataFrames
- `head()` displays the first five rows.
- `head(n)` displays the first `n` rows.
- `tail()` displays the last five rows.
- `tail(n)` displays the last `n` rows.
- `shape` returns a tuple of row count and column count.
- `columns` returns the column names.
- `info()` shows data types, non-null counts, and dataset entry information.

```python
data.head()
data.head(2)
data.tail()
data.tail(2)
data.shape
data.columns
data.info()
```

## Selecting Columns
- Select one column using square brackets:

```python
data["Hours Studied"]
```

- Select multiple columns using a list of column names:

```python
data[["Hours Studied", "Previous Scores"]]
```

## Missing Values
- `isnull()` checks for missing values.
- `isnull().sum()` counts missing values per column.

```python
data.isnull().sum()
```

## Descriptive Statistics
- `describe()` gives summary statistics for numeric columns.
- `mean()` calculates mean values.
- `sum()` calculates totals.
- `mode()` calculates modes.
- `std()` calculates standard deviations.

```python
data.describe()
data.mean()
data.sum()
data.mode()
data.std()
data["Hours Studied"].sum()
```

## Dropping Columns
- `drop()` removes rows or columns.
- `axis=1` means column.
- `axis=0` means row.
- `inplace=True` modifies the original DataFrame.

```python
data.drop(columns="Extracurricular Activities", inplace=True, axis=1)
```

## Counting Values and Sampling
- `value_counts()` counts how often each value appears in a column.
- `sample(n)` returns a random sample of `n` rows.

```python
data["Sleep Hours"].value_counts()

sample_data = data.sample(50)
print(sample_data.shape)
print(sample_data.head())
```

## Reindexing and Setting an Index
- `reindex()` changes the index labels.
- `set_index()` uses an existing column as the index.

```python
new_index = range(20, 10020)
data.reindex(new_index)

data.set_index("Hours Studied")
```

## Filtering Rows
- Filtering selects rows that meet a condition.

```python
bpbelow50 = new_dataset[new_dataset["BloodPressure"] < 50]
outcome1 = new_dataset[new_dataset["Outcome"] == 1]
```

## Selecting Rows and Columns With `iloc`
- `iloc` selects rows and columns by integer position.

```python
new_dataset.iloc[1:10, 1:4]
new_dataset.iloc[:, 1:4]
```

## Sorting
- `sort_values()` sorts a DataFrame by a selected column.
- Important parameters include:
  - `by`: column to sort by.
  - `axis`: axis to sort.
  - `ascending`: `True` for ascending order, `False` for descending order.
  - `inplace`: whether to modify the original DataFrame.
  - `na_position`: where null values should appear.
  - `kind`: sorting algorithm.

```python
new_dataset.sort_values(
    by="Age",
    inplace=True,
    kind="quicksort",
    na_position="last",
    ascending=True
)
```

## What To Remember For Exam Use
- `pd.Series([1, 2, 3, 4])` creates a Series from a list.
- `pd.DataFrame(data)` creates a DataFrame.
- `pd.read_csv("data.csv")` reads a CSV file.
- `df.head()` and `df.head(5)` both show the first five rows.
- `df.shape` returns the number of rows and columns as a tuple.
- `df[["name", "age"]]` selects two columns.
- `df.loc[:, ["name", "age"]]` also selects those columns.
- `df[df["age"] > 30]` filters rows where age is greater than 30.
- `df.sort_values(by="salary")` sorts by salary in ascending order.

## Questions
- Should Module 2 include file loading as examinable content, or will that be separated into Module 3?
- Should practical work use `Admission_Predict.xlsx` directly with `pd.read_excel()` or first convert it to CSV as named in the quiz prompt?
