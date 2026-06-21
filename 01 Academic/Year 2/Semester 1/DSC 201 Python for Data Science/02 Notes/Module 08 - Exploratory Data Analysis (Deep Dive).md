---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: 8
source_files:
  - [[../01 Source Materials/DSC 201 - Module 08 - Exploratory Data Analysis (Deep Dive).html]]
  - [[../01 Source Materials/DSC 201 - Module 08 - Exploratory Data Analysis (Deep Dive).txt]]
  - [[../01 Source Materials/DSC211_module_8 (3).pdf]]
tags:
  - source-backed
  - dsc201
  - module-08
  - exploratory-data-analysis
  - eda
  - pandas
---

# Module 08 - Exploratory Data Analysis (Deep Dive)

## Source
- [[../01 Source Materials/DSC 201 - Module 08 - Exploratory Data Analysis (Deep Dive).html]]
- [[../01 Source Materials/DSC 201 - Module 08 - Exploratory Data Analysis (Deep Dive).txt]]
- [[../01 Source Materials/DSC211_module_8 (3).pdf]]

## Learning Outcomes
By the end of this module, you should be able to:
1. Identify key techniques used in exploratory data analysis.
2. Explain the importance of EDA in preparing data for further analysis.
3. Apply EDA techniques to real-world datasets.
4. Evaluate the effectiveness of different EDA techniques.

## Key Ideas
- Exploratory data analysis is used to understand and prepare datasets before further analysis.
- EDA includes sanity checks, univariate analysis, bivariate analysis, missing value treatment, outlier treatment, and handling categorical data.
- Sanity checks help ensure data is valid, reliable, and consistent.
- Distribution checks use summary statistics, histograms, boxplots, and correlations to understand the data.

## Sanity Checks
Sanity checks are used to confirm that data is reliable and consistent.

Common sanity checks include:
- checking unique values,
- checking duplicates,
- checking consistent categorical labels,
- checking missing values,
- checking data types,
- checking expected numeric ranges.

## Duplicate Records
To check duplicates in one column:

```python
duplicate_ids = data[data.duplicated(subset='User_ID', keep=False)]
duplicate_ids.head()
```

To check whole duplicated transactions:

```python
duplicate_records = data[data.duplicated(keep=False)]
duplicate_records.shape
```

To remove duplicated records:

```python
df_cleaned = data.drop_duplicates(keep='first')
```

## Unique Values And Categorical Consistency
Use `unique()` to check the values in a categorical column.

```python
data["City_Category"].unique()
```

If inconsistent labels exist, use `replace()`.

```python
data['City_Category'] = data['City_Category'].replace('b', 'B')
```

## Missing Values
Use missing value checks to identify missing entries before analysis.

```python
df.isnull().sum()
```

## Outlier Detection
Outliers are values outside the normal range of the data. A boxplot is a simple way to detect them.

```python
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

data = pd.read_csv("Student_Performance.csv")
sns.boxplot(x=data['Performance Index'])
plt.show()
```

Outliers can be removed using filtering:

```python
data_new = data.loc[(data['Performance Index'] <= 100) & (data['Performance Index'] > 0)]
```

Outliers can also be capped by replacing values outside an expected range.

## Data Accuracy Checks
Data accuracy checks confirm that values make sense.

Examples:
- cross-field validation, such as checking that age matches birth date,
- logical consistency, such as start date being before end date,
- aggregation consistency, such as totals matching expected values.

## Distribution Checks
Distribution checks help understand numerical data.

Common methods:
- `describe()` for summary statistics,
- histograms and boxplots for distribution and outliers,
- `corr()` for correlation between numerical variables.

```python
df.describe()
df.corr()
```

## Sampling Bias Checks
Sampling bias checks confirm that a sample is representative of the population.

Examples:
- checking that no group is over-represented,
- checking that stratified samples are balanced.

## Temporal Consistency Checks
Temporal consistency checks are used for date and time data.

Examples:
- checking gaps in time series data,
- checking seasonal patterns and trends.

## Contextual Checks
Contextual checks compare findings with real-world knowledge.

Examples:
- domain knowledge validation,
- benchmarking against external or industry standards.

## Data Type Checks
Data type checks confirm that values are stored in the correct format.

Examples:
- dates stored as datetime objects,
- numeric values stored as integers or floats,
- strings converted correctly when needed.

## Practice Pattern
The module ends with a generated product dataset and asks for checks:
1. Check missing values.
2. Verify that `Price` contains only positive values.
3. Ensure `Quantity` contains only non-negative integers.

```python
import pandas as pd

data = {
    'Product ID': [101, 102, 103, 104, 105],
    'Product Name': ['Widget A', 'Widget B', 'Gadget C', 'Gizmo D', 'Tool E'],
    'Price': [19.99, 29.99, -15.00, 25.50, None],
    'Quantity': [10, 5, 0, -3, 7]
}

df = pd.DataFrame(data)
```

Useful checks:

```python
print(df.isnull().sum())
print(df[df["Price"] <= 0])
print(df[df["Quantity"] < 0])
```

## Exam Reminders
- `df.describe()` gives statistical summaries of numerical columns.
- `df.corr()` calculates the correlation matrix for numerical columns.
- `df['column'].unique()` returns unique values in a column.
- `df.duplicated()` identifies duplicate rows.
- `drop_duplicates()` removes duplicate rows.

