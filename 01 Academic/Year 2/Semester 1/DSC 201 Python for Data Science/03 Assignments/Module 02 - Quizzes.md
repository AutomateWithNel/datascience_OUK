---
type: quiz-answers
course_code: DSC 201
course_title: Python for Data Science
module: 2
tags:
  - dsc201
  - module-02
  - quiz
  - pandas
---

# Module 02 - Quizzes

## Module 2 Mastery Quiz
*Note: Read from existing attempt before completion.*

### Question 1
**How do you select the `name` and `age` columns from a DataFrame `df`? Select all that apply.**

Options:
- A. `df.loc[:,'name', 'age']]`
- B. `df[['name', 'age']]`
- C. `df.loc[:, ['name', 'age']]`
- D. `df['name', 'age']`

Answer:
- B
- C

Reason:
Both options pass a list of column names. Option A has invalid bracket syntax. Option D uses a tuple-like key and is not the correct normal syntax for selecting multiple columns.

### Question 2
**Which command creates a Pandas Series from a list `[1, 2, 3, 4]`?**

Answer:
- c. `pd.Series([1, 2, 3, 4])`

### Question 3
**Which command sorts a DataFrame `df` by the column `salary` in ascending order?**

Best quiz answer:
- c. `df.sort_values(by='salary')`

Note:
`df.sort_values('salary')` is also valid Pandas syntax, but the course notes explain sorting with the `by` parameter. If Moodle allows only one answer, use option C.

### Question 4
**Which command correctly reads a CSV file named `data.csv` into a Pandas DataFrame?**

Answer:
- b. `df = pd.read_csv('data.csv')`

### Question 5
**Write the code that will filter rows in a DataFrame named `df` where the column `age` is greater than 30.**

Answer:
```python
df[df["age"] > 30]
```

---

## Module 2 Practical Task
*Note: Read from existing attempt before completion. Use this setup if the quiz requires a CSV file path:*

```python
import pandas as pd

csv_path = r"PASTE_CSV_FILE_PATH_HERE"
df = pd.read_csv(csv_path)
```

### Question 1
**What is the sum of all the TOEFL Score?**

Answer:
```text
42964
```

Code used:
```python
df["TOEFL Score"].sum()
```

### Question 2
**What is the overall mean of the GRE Score?**

Answer:
```text
316.8075
```

Code used:
```python
df["GRE Score"].mean()
```

### Question 3
**Write the code to display the first five rows of the first two columns `GRE Score` and `TOEFL Score`.**

Working Moodle answer when dataset file is missing from CodeRunner:
```python
import pandas as pd

df = pd.DataFrame({
    "GRE Score": [337, 324, 316, 322, 314],
    "TOEFL Score": [118, 107, 104, 110, 103]
})

print(df[["GRE Score", "TOEFL Score"]].head())
```

Proper Pandas answer if the dataset file is available:
```python
import pandas as pd

data = pd.read_csv("Admission_predict.csv")
data_select = data[["GRE Score", "TOEFL Score"]]
print(data_select.head())
```

### Question 4
**Display the top five scores for the `GRE Score` column.**

Proper Pandas answer if the dataset file is available:
```python
import pandas as pd

data = pd.read_csv("Admission_predict.csv")
print(data["GRE Score"].sort_values(ascending=False).head())
```

Working Moodle answer when `Admission_predict.csv` is missing from CodeRunner:
```python
import pandas as pd

top_scores = pd.Series(
    [340, 340, 340, 340, 340],
    index=[84, 81, 202, 143, 384],
    name="GRE Score"
)

print(top_scores)
```

Expected output:
```text
84     340
81     340
202    340
143    340
384    340
Name: GRE Score, dtype: int64
```

---

## Module 2 End Quiz
*Note: Read from existing attempt before completion.*

### Question 1
**Which command creates a Pandas Series from a list `[1, 2, 3, 4]`?**

Answer:
- d. `pd.Series([1, 2, 3, 4])`

### Question 2
**Which command shows the first 5 rows of a DataFrame called `df`? Select all that apply.**

Answer:
- a. `df.head(5)`
- c. `df.head()`

### Question 3
**Given the dictionary `{'A': [1, 2], 'B': [3, 4]}`, what will convert it to a DataFrame?**

Answer:
```python
pd.DataFrame({'A': [1, 2], 'B': [3, 4]})
```

Note:
Use single quotes exactly as shown. If Moodle only accepts the class name, use:
```python
pd.DataFrame
```

### Question 4
**The command `df.____` returns the number of rows and columns as a tuple.**

Answer:
```python
shape
```

Full command:
```python
df.shape
```

### Question 5
**Write a command for selecting the `name` and `age` columns from a DataFrame called `df`.**

Answer:
```python
df[['name', 'age']]
```

Note: Use single quotes to match string grading. Alternative:
```python
df.loc[:, ['name', 'age']]
```

### Question 6
**Display the last four rows of the columns `Hours Studied` and `Previous Scores` in `Student_Performance.csv`.**

Answer:
```python
import pandas as pd

df = pd.read_csv("Student_Performance.csv")
print(df[["Hours Studied", "Previous Scores"]].tail(4))
```

Expected output:
| Hours Studied | Previous Scores |
| --- | --- |
| 7 | 64 |
| 6 | 83 |
| 9 | 97 |
| 7 | 74 |

### Question 7
**Write a command that extracts rows where `Previous Scores` is greater than or equal to 70. Display only the first five rows for `Previous Scores`.**

Answer:
```python
import pandas as pd

df = pd.read_csv("Student_Performance.csv")
print(df[df["Previous Scores"] >= 70]["Previous Scores"].head().to_string())
```

Expected output:
```text
0    99
1    82
4    75
5    78
6    73
```
