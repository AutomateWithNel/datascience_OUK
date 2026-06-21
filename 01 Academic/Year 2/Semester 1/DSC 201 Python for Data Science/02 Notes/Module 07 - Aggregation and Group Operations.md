---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: 7
source_files:
  - [[../01 Source Materials/DSC 201 - Module 07 - Aggregation and Group Operations.html]]
  - [[../01 Source Materials/DSC 201 - Module 07 - Aggregation and Group Operations.txt]]
  - [[../01 Source Materials/Group_Operations_in_Pandas.ipynb]]
  - [[../01 Source Materials/black_friday.csv]]
tags:
  - source-backed
  - dsc201
  - module-07
  - pandas
  - groupby
  - aggregation
---

# Module 07 - Aggregation and Group Operations

## Source
- [[../01 Source Materials/DSC 201 - Module 07 - Aggregation and Group Operations.html]]
- [[../01 Source Materials/DSC 201 - Module 07 - Aggregation and Group Operations.txt]]
- [[../01 Source Materials/Group_Operations_in_Pandas.ipynb]]
- [[../01 Source Materials/black_friday.csv]]

## Learning Outcomes
By the end of this module, you should be able to:
1. Recognize the mechanics of the group-by operation and data aggregation.
2. Apply multiple aggregation functions for column-wise aggregation.
3. Apply the split-apply-combine methodology to analyze data.
4. Interpret pivot tables and cross-tabulations.

## Key Ideas
- Aggregation and grouping are used for summarizing, transforming, and filtering datasets.
- Group operations follow the split-apply-combine process.
- `groupby()` creates grouped data, but an aggregate function is needed to produce useful output.
- Aggregation functions calculate summary statistics for grouped values.
- Common aggregate functions include `count()`, `sum()`, `mean()`, `median()`, `std()`, `min()`, `max()`, `prod()`, `first()`, and `last()`.

## Split-Apply-Combine
The group operation has three main steps:
1. Split the data into groups using one or more keys.
2. Apply a function to each group.
3. Combine the results into a DataFrame or Series.

## Basic GroupBy
Import Pandas and load data:

```python
import pandas as pd

data = pd.read_csv("IRIS.csv")
data.head(2)
```

Group by one column:

```python
grouped = data.groupby("species")
```

Calculate the average value for one column:

```python
grouped["sepal_length"].mean()
```

## Grouping By Multiple Columns
The course notes use a dataset where data is grouped by team and position:

```python
data_two = data.groupby(["Team", "Position"])
```

After grouping, select a column and aggregate it:

```python
grouped1 = data_two["Weight"]
grouped1.agg("mean")
```

## Multiple Aggregations
Use `agg()` when you need more than one summary statistic:

```python
grouped1.agg(["mean", "std", "min", "max", "count"])
```

This returns several statistics for each group.

## Class Notebook Pattern
The class notebook shows the same idea with a small DataFrame:

```python
import pandas as pd

data = {
    'Team': ['A', 'A', 'B', 'B', 'C', 'C'],
    'Player': ['John', 'Mike', 'Sara', 'Tom', 'Anna', 'Chris'],
    'Score': [5, 7, 8, 10, 6, 9]
}

df = pd.DataFrame(data)
grouped = df.groupby('Team')
```

Aggregate one column:

```python
print(grouped['Score'].sum())
print(grouped['Score'].mean())
```

Group by more than one column:

```python
grouped_multi = df.groupby(['Team', 'Player'])
print(grouped_multi.sum())
```

## Transform
Use `transform()` when the result should align back to the original DataFrame.

```python
df['Mean_Score'] = grouped['Score'].transform('mean')
```

## Filtering Groups
Use `filter()` to keep only groups that satisfy a condition.

```python
filtered = grouped.filter(lambda x: x['Score'].sum() > 15)
```

## Resetting Index
After a group operation, `reset_index()` can return the grouped index back into normal columns.

```python
result = grouped['Score'].sum().reset_index()
```

## Exam Reminders
- `groupby()` is used to split data into groups.
- `agg()` applies aggregate functions to grouped data.
- `df.groupby(['col1', 'col2'])` groups by two columns.
- `reset_index()` resets the DataFrame index.
- `merge()` is not an aggregate function.
