---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: 5
source_files:
  - [[../../01 Source Materials/Module 05 - Data Wrangling/DSC 201 - Module 05 - Data Wrangling.html]]
  - [[../../01 Source Materials/Module 05 - Data Wrangling/DSC 201 - Module 05 - Data Wrangling.txt]]
tags:
  - source-backed
  - dsc201
  - module-05
  - pandas
  - data-wrangling
---

# Module 05 - Data Wrangling

## Source
- [[../../01 Source Materials/Module 05 - Data Wrangling/DSC 201 - Module 05 - Data Wrangling.html]]
- [[../../01 Source Materials/Module 05 - Data Wrangling/DSC 201 - Module 05 - Data Wrangling.txt]]

## Learning Outcomes
By the end of this module, you should be able to:
1. Identify the different data wrangling operations available in Pandas.
2. Explain the purpose and functionality of data joins, reshaping techniques, and filtering methods in Pandas.
3. Apply data wrangling techniques to real-world datasets using Pandas.
4. Evaluate the effectiveness of different data wrangling techniques in achieving specific data manipulation objectives.

## Key Ideas
- In real-world applications, data comes from different sources and in different formats.
- Data wrangling (or data munging) is the process of changing or transforming data from one shape to another.
- Wrangling involves restructuring, cleaning, and converting data into an analysis-ready format.
- Key operations include combining DataFrames (joining, merging, concatenating), reshaping (grouping, pivoting, stacking, transposing), and filtering.
- Code should be simplified to coursework, not beautified by AI.

---

## Combining DataFrames
Pandas provides three primary methods to combine DataFrames: `join()`, `merge()`, and `concat()`.

### 1. `join()` Method
`join()` is best used for combining DataFrames using a common column or a common index (it is easier to join on an index than a column).
- **Syntax:** `DataFrame.join(other, on=None, how='left', lsuffix='', rsuffix='', sort=False)`
- **Parameters:**
  * `other`: The DataFrame to be combined.
  * `how`: Type of join to perform:
    * `'left'`: Use keys from the calling DataFrame. Keeps all records from the left, matches from the right.
    * `'right'`: Use keys from the other DataFrame. Keeps all records from the right, matches from the left.
    * `'outer'`: Uses union of keys from both (returns all elements).
    * `'inner'`: Uses intersection of keys (returns only matching records).
  * `lsuffix` / `rsuffix`: Suffix to apply to overlapping column names.
  * `sort`: Sort the index of the resulting DataFrame.

*Example (joining on index after setting index):*
```python
new_data_index = customer.set_index("Product_ID").join(
    products.set_index("Product_ID"), how="inner", sort=True
)
```

### 2. `merge()` Function
`merge()` is a flexible function designed for column-based combining (similar to database SQL joins).
- **Syntax:** `pd.merge(left, right, how='inner', on=None, left_on=None, right_on=None, left_index=False, right_index=False, sort=False, suffixes=('_x', '_y'))`
- **Parameters:**
  * `left` / `right`: The DataFrames to combine.
  * `how`: `'inner'`, `'outer'`, `'left'`, or `'right'`.
  * `on`: Column name present in both DataFrames to join on.
  * `left_on` / `right_on`: Custom columns to join on if their names differ.
  * `sort`: Sort the join keys lexicographically.

*Example:*
```python
df_merger = pd.merge(customer, products, on="Product_ID", how="inner", sort=True)
```

### 3. `concat()` Function
`concat()` is used to concatenate series or dataframes along a particular axis (rows or columns). Unlike `join` and `merge`, `concat` can combine more than two objects at once.
- **Syntax:** `pd.concat(objs, axis=0, join='outer', ignore_index=False, keys=None)`
- **Parameters:**
  * `objs`: A list or dictionary of Series or DataFrames.
  * `axis`: The axis to concatenate along (`0` for rows/vertical stack, `1` for columns/horizontal stack).
  * `join`: `'outer'` (union of indexes) or `'inner'` (intersection of indexes).
  * `ignore_index`: If `True`, do not use the index values along the concatenation axis (resets index to 0, 1, ...).

*Example:*
```python
# Vertical concatenation
data_concat = pd.concat([customer, products], axis=0, ignore_index=True)
```

---

## Reshaping
Reshaping changes the structure or layout of a DataFrame for specific analytical needs.

### 1. Grouping (`groupby()`)
`groupby()` groups data into categories to perform aggregate calculations (like mean, sum, or count).
- **Syntax:** `DataFrame.groupby(by=None, axis=0, as_index=True, sort=True, dropna=True)`
- **Parameters:**
  * `by`: The column(s) to group by.
  * `as_index`: If `True`, group labels will be returned as the index.

*Example:*
```python
# Grouping by Type of Travel and Gender, then counting
data_airline.groupby(by=["Type of Travel", "Gender"])["Type of Travel"].count()
```

### 2. Pivoting (`pivot()` and `pivot_table()`)
Pivoting converts a DataFrame from long format (rows represent individual observations) to wide format (columns represent unique category values).
- **`pivot()`**: Rearranges data without aggregation (requires unique index-column pairs).
  * **Syntax:** `df.pivot(index, columns, values)`
- **`pivot_table()`**: Similar to `pivot()`, but allows aggregation (handles duplicate index-column pairs).
  * **Syntax:** `pd.pivot_table(df, values, index, columns, aggfunc='mean')`

*Example:*
```python
# Summarizing sales by date and region using pivot_table
pivot_table_df = pd.pivot_table(df, values='sales', index='date', columns='region', aggfunc='sum')
```

### 3. Stacking and Unstacking
- **`stack()`**: Converts a DataFrame from wide format to long format (moves column labels to the innermost row index).
- **`unstack()`**: Reverses `stack()`, converting a DataFrame from long format back to wide format.

*Example:*
```python
# Stacking a wide DataFrame
stacked_df = df.set_index('date').stack()

# Unstacking back
unstacked_df = stacked_df.unstack()
```

### 4. Transposing
Transposing flips the rows and columns of a DataFrame.
- **Methods:** Use `.T` attribute or `.transpose()` method.

---

## Filtering
Filtering selects a subset of rows or columns based on conditions.

### 1. Column-based Filtering (Boolean Indexing)
Selects rows based on boolean conditions applied to column values.
```python
# Filter rows where sepal_length is greater than or equal to 5
filtered_data = data[data['sepal_length'] >= 5]
```

### 2. `query()` Method
Provides a clean, string-based interface for querying DataFrames using boolean expressions.
- **Syntax:** `DataFrame.query('boolean_expression')`
- **Key Rules:**
  * Requires column names to be valid Python identifiers (if they contain spaces, wrap them in backticks `` ` ``).
  * Prefix variables outside the DataFrame with `@` (e.g., `query('age > @min_age')`).
  * You can use string methods (like `.str.contains()`).

*Example:*
```python
data_two_query = data.query('sepal_length > 3 and species == "Iris-setosa"')
```

### 3. Index-based Filtering (`loc[]` and `iloc[]`)
- **`loc[]`**: Label-based indexing. Selects rows/columns by their index labels or boolean arrays.
  ```python
  data_loc = data.loc[[10]] # Select row where index label is 10
  ```
- **`iloc[]`**: Integer-location based indexing. Selects rows/columns by their numerical position (0-indexed).
  ```python
  filtered_data = data.iloc[[1, 5]] # Select rows at positions 1 and 5
  ```

---

## Exam Reminders
- Use `pd.concat()` to stack DataFrames vertically (`axis=0`) or horizontally (`axis=1`).
- `join()` combines based on indexes; `merge()` is used for column-based joins.
- `unstack()` converts from long format to wide format.
- `stack()` converts from wide format to long format.
- `groupby()` is used to group data by one or more columns for aggregation.
- `query()` requires column names to be valid python identifiers or wrapped in backticks.
- `.loc[]` selects by index label; `.iloc[]` selects by integer position.
