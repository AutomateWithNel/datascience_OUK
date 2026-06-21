---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: 10
source_files:
  - [[../01 Source Materials/Module 10 - Introduction to modelling libraries in python - Moodle Extract]]
  - https://wesmckinney.com/book/modeling
tags:
  - source-backed
  - dsc201
  - module-10
  - modelling-libraries
  - scikit-learn
  - statsmodels
---

# Module 10 - Introduction to modelling libraries in python

## Source
- [[../01 Source Materials/Module 10 - Introduction to modelling libraries in python - Moodle Extract]]
- [Introduction to Modeling Libraries in Python](https://wesmckinney.com/book/modeling)

## Learning Outcomes
By the end of this module, you should be able to:
1. Describe the key functionalities and capabilities of popular Python modelling libraries.
2. Compare and contrast different modelling libraries in Python.
3. Use modelling libraries to implement basic machine learning applications.
4. Assess the performance and suitability of models built using these libraries.

## Key Ideas
- Modelling libraries help build statistical, machine learning, and deep learning models.
- The Moodle overview names Statsmodels and Scikit-learn as the main modelling libraries for this module.
- Pandas is commonly used for data loading, cleaning, wrangling, and feature preparation before fitting models.
- Many modelling libraries use NumPy arrays internally, so Pandas data often needs to be converted into arrays.
- Missing values usually need to be handled before passing data into modelling libraries.

## Pandas And Model Code
Pandas DataFrames are useful during data preparation, but modelling libraries often expect NumPy arrays.

```python
data.to_numpy()
```

To select only the model columns before converting:

```python
model_cols = ["x0", "x1"]
data.loc[:, model_cols].to_numpy()
```

## Dummy Variables
Categorical data normally needs to be converted before modelling.

```python
dummies = pd.get_dummies(data["category"], prefix="category", dtype=float)
data_with_dummies = data.drop("category", axis=1).join(dummies)
```

## Patsy
Patsy is used to describe statistical models using formula syntax.

```python
y ~ x0 + x1
```

In formula syntax, `+` adds terms to the model formula. It does not mean normal arithmetic addition.

## Statsmodels
Statsmodels is used for statistical modelling, statistical tests, and model diagnostics.

Common model types include:
- linear models,
- generalized linear models,
- analysis of variance,
- time series models.

Statsmodels can be used with an array-based API:

```python
import statsmodels.api as sm

model = sm.OLS(y, X)
results = model.fit()
print(results.params)
```

It can also be used with a formula API:

```python
import statsmodels.formula.api as smf

results = smf.ols("y ~ col0 + col1 + col2", data=data).fit()
print(results.params)
```

## Scikit-Learn
Scikit-learn is a widely used Python machine learning library.

It supports:
- supervised learning,
- unsupervised learning,
- classification,
- clustering,
- prediction,
- model selection,
- model evaluation,
- data transformation.

Typical workflow:
1. Prepare the data with Pandas.
2. Convert the needed columns into model-ready form.
3. Handle missing values.
4. Split data into training and testing data.
5. Fit the model.
6. Evaluate the model.

## Exam Reminders
- Statsmodels focuses on statistical models and diagnostics.
- Scikit-learn focuses on general-purpose machine learning.
- DataFrames can be converted to NumPy arrays using `to_numpy()`.
- Use `pd.get_dummies()` to convert categorical values into dummy variables.
- Handle missing values before fitting models.
- Model performance should be assessed before deciding whether a model is suitable.

