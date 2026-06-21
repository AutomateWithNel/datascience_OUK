---
type: quiz-answers
course_code: DSC 201
course_title: Python for Data Science
module: 3
tags:
  - dsc201
  - module-03
  - quiz
  - pandas
---

# Module 03 - Quizzes

## Module 3 Mastery Quiz
*Note: Read from existing attempt before completion.*

### Question 1
**______________ is a function used to read a Json file into a Pandas DataFrame?**

Options:
- a. `pd.readjson()`
- b. `pd.writejson()`
- c. `pd.write_json()`
- d. `pd.read_json()`

Answer:
- d. `pd.read_json()`

### Question 2
**______________is the correct method to save a DataFrame as an Excel file?**

Options:
- a. `pd.read_exce()`
- b. `df.to_csv()`
- c. `df to sql()`
- d. `df to excel()`

Answer:
- d. `df to excel()`

Note:
The correct Pandas method is `df.to_excel()`. Moodle's option appears to have a typo, but option `d` is clearly the intended Excel-saving method.

### Question 3
**What parameter is used with `pd.read_csv()` to specify the column names?**

Options:
- a. `columns`
- b. `header`
- c. `fields`
- d. `names`

Answer:
- d. `names`

Explanation:
Use `names=[...]` when passing custom column names to `pd.read_csv()`. The `header` parameter controls which row is treated as the header.

### Question 4
**When working with web APIs, which Python library is commonly used to make HTTP requests and retrieve JSON data that can be converted into a Pandas DataFrame?**

Options:
- a. `sqlite3`
- b. `xml.etree.ElementTree`
- c. `requests`
- d. `os`

Answer:
- c. `requests`

### Question 5
**Which function in Pandas is used to read data from a SQL database into a DataFrame?**

Options:
- a. `pd.read_hdf()`
- b. `pd.read_sql()`
- c. `pd.read_clipboard()`
- d. `pd.read_table()`

Answer:
- b. `pd.read_sql()`

### Question 6
**Which function would you use to save a DataFrame in a binary format that preserves data types and is highly efficient for large datasets?**

Options:
- a. `df.to_excel()`
- b. `df.to_csv()`
- c. `df.to_sql()`
- d. `df.to_pickle()`

Answer:
- d. `df.to_pickle()`

### Question 7
**Which method would you use to save a DataFrame to an HDF5 file?**

Options:
- a. `df.to_excel()`
- b. `df.to_pickle()`
- c. `df.to_csv()`
- d. `df.to_hdf()`

Answer:
- d. `df.to_hdf()`

### Question 8
**Which of the following is the correct way to convert a JSON response from a web API to a Pandas DataFrame?**

Options:
- a. `df = pd.read_csv(response)`
- b. `df = pd.read_html(response.text)`
- c. `df = pd.DataFrame(response)`
- d. `df = pd.read_json(response.text)`

Answer:
- d. `df = pd.read_json(response.text)`
