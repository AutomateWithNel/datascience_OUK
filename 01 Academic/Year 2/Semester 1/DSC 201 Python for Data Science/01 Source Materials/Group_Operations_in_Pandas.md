# Group Operations in Pandas

## Introduction
Group operations in Pandas involve splitting the data into groups, applying operations on these groups, and combining the results. 
This is referred to as the **split-apply-combine** paradigm.

### Key Steps:
1. **Split**: Divide the data into groups based on some criteria.
2. **Apply**: Perform an operation (e.g., aggregation, transformation) on each group.
3. **Combine**: Merge the results back into a structured form.

We use the `groupby` method in Pandas to perform these operations.

## 1. Basic Grouping

```python
import pandas as pd

# Sample DataFrame
data = {
    'Team': ['A', 'A', 'B', 'B', 'C', 'C'],
    'Player': ['John', 'Mike', 'Sara', 'Tom', 'Anna', 'Chris'],
    'Score': [5, 7, 8, 10, 6, 9]
}

df = pd.DataFrame(data)

# Display the DataFrame
df
```

### Grouping by a Single Column

```python
# Grouping by 'Team'
grouped = df.groupby('Team')

# Viewing grouped data
for name, group in grouped:
    print(f"Group: {name}")
    print(group)
```

## 2. Aggregate Functions

```python
# Aggregations on 'Score'
print("Sum of Scores:")
print(grouped['Score'].sum())

print("Mean of Scores:")
print(grouped['Score'].mean())
```

### Custom Aggregations

```python
# Custom aggregation function
def score_range(x):
    return x.max() - x.min()

print("Range of Scores:")
print(grouped['Score'].apply(score_range))
```

## 3. Advanced Grouping Techniques

### Grouping by Multiple Columns

```python
# Grouping by 'Team' and 'Player'
grouped_multi = df.groupby(['Team', 'Player'])
print(grouped_multi.sum())
```

### Transformations with `transform`

```python
# Adding a column with the mean score of each team
df['Mean_Score'] = grouped['Score'].transform('mean')
df
```

### Filtering Groups

```python
# Filtering teams with total scores greater than 15
filtered = grouped.filter(lambda x: x['Score'].sum() > 15)
filtered
```

## 4. Resetting Index

```python
# Resetting index after group operations
result = grouped['Score'].sum().reset_index()
result
```

## 5. Practice Problems

### Problem 1: Student Grades
Create a DataFrame for student grades with the following columns: `Class`, `Student`, and `Grade`. Perform the following:
1. Group data by `Class` and calculate the average grade.
2. Filter classes where the average grade is above 60.
3. Add a new column that shows the highest grade in each class using `transform`.

```python
# Sample DataFrame for practice
data = {
    'Class': ['Math', 'Math', 'English', 'English', 'Science', 'Science'],
    'Student': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank'],
    'Grade': [85, 78, 92, 88, 70, 75]
}

grades_df = pd.DataFrame(data)

# Solution
# 1. Group by 'Class' and calculate the average grade
class_grouped = grades_df.groupby('Class')
print("Average Grade:")
print(class_grouped['Grade'].mean())

# 2. Filter classes with average grade > 60
filtered_classes = class_grouped.filter(lambda x: x['Grade'].mean() > 60)
print("Filtered Classes:")
print(filtered_classes)

# 3. Add a column for the highest grade in each class
grades_df['Max_Grade'] = class_grouped['Grade'].transform('max')
grades_df
```
