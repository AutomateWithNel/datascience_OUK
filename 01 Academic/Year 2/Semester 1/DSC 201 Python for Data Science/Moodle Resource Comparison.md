---
type: moodle-resource-comparison
course_code: DSC 201
course_title: Python for Data Science
checked: 2026-06-19
source: Moodle API
---

# Moodle Resource Comparison

## Summary
Moodle exposes downloadable learning resources for Modules 1 to 4.

The content already shared locally matches Moodle for Modules 1 and 2. Modules 3 and 4 have been extracted from Moodle, downloaded, and summarized into full vault notes.

## Module 1: Numpy
Moodle resource: `Introduction to Numpy`

Extractable Moodle file:
- `module_1.pdf`

Comparison result:
- Local file: `01 Source Materials/Module 01 - NumPy/DSC 201 - Module 01 - NumPy.pdf`
- Moodle file size: `235951`
- Local file size: `235951`
- SHA-256 match: `true`

Conclusion: the local Module 1 NumPy PDF is the same file as the Moodle resource.

## Module 2: Introduction to Pandas
Moodle resource: `Introduction to Pandas`

Extractable Moodle files:
- `index.html`
- `Student_Performance.csv`
- `diabetes.csv`

Comparison result:
- Local note source: `01 Source Materials/Module 02 - Introduction to Pandas/DSC 201 - Module 02 - Introduction to Pandas.txt`
- Moodle text extracted from `index.html`
- Local note lines checked: `135`
- Lines found in Moodle text: `135`
- Match rate: `100%`

Exact file comparison:
- Local `Student_Performance.csv` matches Moodle `Student_Performance.csv`
- SHA-256 match: `true`

Conclusion: the Module 2 notes shared locally are the same content as the Moodle Module 2 learning resource. The Moodle resource also exposes `diabetes.csv`, which is referenced in the Module 2 notes and has now been imported into the Module 2 source folder.

## Module 3: Data Loading and File Formats in Pandas
Moodle resource: `Data Loading and file formats`

Extractable Moodle files:
- `index.html`
- `build.zip`

Text extraction result:
- Extracted text length: about `13012` characters
- Main title found: `MODULE 3: DATA LOADING AND FILE FORMATS IN PANDAS`
- Learning outcomes found:
  - Identify common text formats Pandas can read from and write to, such as CSV and JSON.
  - Demonstrate how to read and write to binary file formats.
  - Construct a workflow that retrieves data from a web API, SQL, and NoSQL, processes it using Pandas, and saves the result to a database.
  - Present data collected from different file formats in a Pandas DataFrame.

Conclusion: Module 3 content can be extracted from Moodle and has now been converted into a full vault note.

## Module 4: Data Cleaning and Preparation
Moodle resource: `Data cleaning notes`

Extractable Moodle files:
- `index.html`

Text extraction result:
- Extracted text length: about `13564` characters
- Main title found: `MODULE 4: DATA CLEANING AND PREPARATION`
- Learning outcomes found:
  - Recall methods for identifying and handling missing data in Pandas.
  - Explain data transformation using Pandas functions.
  - Apply data cleaning and preparation techniques to real-world datasets.
  - Analyze the effectiveness of cleaning techniques in improving data quality.

Conclusion: Module 4 content can be extracted from Moodle and has now been converted into a full vault note.

## Quiz Content
The course contents API exposes quiz activity names and quiz metadata, but it does not expose quiz questions directly.

Exposed quiz activities:
- Module 1: `Comprehension Quiz`, `Module 1 Practical Task`, `Test Your Knowledge`
- Module 2: `Module 2 Mastery quiz`, `Module 2: Practical task`, `Module 2_end quiz`
- Module 3: `Module 3 Mastery quiz`
- Module 4: `Module 4 Mastery quiz`

To inspect actual Moodle quiz questions through the API, an existing attempt or a newly started attempt is usually required. Starting a new attempt can consume an allowed attempt, so do not do that unless explicitly authorized.
