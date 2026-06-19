---
type: quiz-answers
course_code: DSC 201
course_title: Python for Data Science
module: 4
tags:
  - dsc201
  - module-04
  - quiz
  - pandas
  - data-cleaning
---

# Module 04 - Quizzes

## Availability Summary

| Module | Quiz | Moodle state | Questions read | Action |
| --- | --- | --- | --- | --- |
| Module 1 | Comprehension Quiz | finished | 0 | Review blocked by Moodle |
| Module 1 | Module 1 Practical Task | finished | 1 | Review readable |
| Module 1 | Test Your Knowledge | finished | 1 | Review readable |
| Module 2 | Module 2 Mastery quiz | in progress | 5 | Questions and answers below |
| Module 2 | Module 2: Practical task | in progress | 4 | Questions and answers below |
| Module 2 | Module 2_end quiz | in progress | 7 | Questions and answers below |
| Module 3 | Module 3 Mastery quiz | in progress | 8 | Questions and answers below |
| Module 4 | Module 4 Mastery quiz | in progress | 5 | Questions and answers below |

---

## Module 4 Mastery Quiz
*Note: Read from in-progress attempt.*

### Question 1
**Given the Series `s = pd.Series([1, 2, np.nan, 4, np.nan, 6])`, what will `s.fillna(method='ffill')` do?**

Options:
- a. Fill missing values with the mean of the Series.
- b. Fill missing values with the next non-missing value.
- c. Fill missing values with `0`.
- d. Fill missing values with the previous non-missing value.

Answer:
- d. Fill missing values with the previous non-missing value.

Explanation:
`ffill` means forward fill. It carries the last valid value forward.

### Question 2
**To convert categorical variables into numerical values using one-hot encoding in pandas, which function would you use?**

Options:
- a. `pd.to_numeric()`
- b. `pd.get_dummies()`
- c. `pd.factorize()`
- d. `pd.one_hot()`

Answer:
- b. `pd.get_dummies()`

### Question 3
**Which of the following lines of code will replace all missing values in a DataFrame with the mean of their respective columns?**

Options:
- a. `df.dropna(inplace=True)`
- b. `df.fillna(df.mean(), inplace=True)`
- c. `df.replace(np.nan, 0, inplace=True)`
- d. `df.mean().fillna(inplace=True)`

Answer:
- b. `df.fillna(df.mean(), inplace=True)`

### Question 4
**Which of the following pandas function is used to remove rows with missing values?**

Options:
- a. `isna()`
- b. `dropna()`
- c. `notna()`
- d. `fillna()`

Answer:
- b. `dropna()`

### Question 5
**Which of the following statements is true when using `drop_duplicates()` on a DataFrame?**

Options:
- a. It only removes duplicates if the entire row is identical.
- b. It removes the last occurrence of duplicates by default.
- c. It permanently removes duplicate rows by default.
- d. It can only remove duplicates based on a single column.

Answer:
- a. It only removes duplicates if the entire row is identical.

Explanation:
When `subset` is not specified, `drop_duplicates()` considers all columns. By default it keeps the first occurrence and returns a new DataFrame unless `inplace=True`.
