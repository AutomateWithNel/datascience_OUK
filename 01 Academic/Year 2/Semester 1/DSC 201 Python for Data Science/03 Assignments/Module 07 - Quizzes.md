---
type: quiz-answers
course_code: DSC 201
course_title: Python for Data Science
module: 7
tags:
  - dsc201
  - module-07
  - quiz
  - groupby
  - aggregation
---

# Module 07 - Quizzes

## Module 7: End of Module Assessment
*Note: Read from existing attempt before completion. No answers were saved, checked, or submitted in Moodle.*

### Question 1
**Given the student performance dataset named `Student_Performance.csv`, which is attached in this code, group the data by the `Extracurricular Activities` column and calculate the mean, standard deviation, and the count of the `Sleep Hours` column.**

Answer:

```python
import pandas as pd

data = pd.read_csv("Student_Performance.csv")

grouped = data.groupby("Extracurricular Activities")

print(grouped["Sleep Hours"].agg(["mean", "std", "count"]))
```

### Question 2
**Write a script that reads the `sales_data_records.csv` file into a Pandas DataFrame, groups the data by `Category` and `Region`, and calculates the minimum and maximum values for the `Total Sales` column. Display the output.**

Answer:

```python
import pandas as pd

data = pd.read_csv("sales_data_records.csv")

grouped = data.groupby(["Category", "Region"])

print(grouped["Total Sales"].agg(["min", "max"]))
```

### Question 3
**If you group data by a specific column but do not apply any aggregate function, what will be the result?**

Answer:
- b. A grouped DataFrame with no visible output

### Question 4
**What does the `reset_index()` function do?**

Answer:
- c. Resets the index of the DataFrame

### Question 5
**What is the main purpose of aggregation and group operations in data analysis?**

Answer:
- c. Summarizing, transforming, and filtering datasets

### Question 6
**When applying the `agg()` function to grouped data, what type of output is generated?**

Answer:
- c. Multiple statistics, such as mean, std, min, and max

### Question 7
**Which function in Pandas is used to calculate the mean of grouped data?**

Answer:
- c. `mean()`

### Question 8
**Which of the following describes the split-apply-combine process well?**

Answer:
- a. Splitting data into groups, applying a function, and combining results

### Question 9
**Which of the following is NOT a predefined aggregate function in Pandas?**

Answer:
- b. `merge()`

### Question 10
**Which of the following operations would you use to group data by two columns in Pandas?**

Answer:
- b. `df.groupby(['col1', 'col2'])`
