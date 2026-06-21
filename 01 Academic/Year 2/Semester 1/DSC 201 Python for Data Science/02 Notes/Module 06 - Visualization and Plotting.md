---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: 6
source_files:
  - [[../01 Source Materials/DSC 201 - Module 06 - Visualization and Plotting.html]]
  - [[../01 Source Materials/DSC 201 - Module 06 - Visualization and Plotting.txt]]
tags:
  - source-backed
  - dsc201
  - module-06
  - visualization
  - matplotlib
  - seaborn
  - plotly
---

# Module 06 - Visualization and Plotting

## Source
- [[../01 Source Materials/DSC 201 - Module 06 - Visualization and Plotting.html]]
- [[../01 Source Materials/DSC 201 - Module 06 - Visualization and Plotting.txt]]

## Learning Outcomes
By the end of this module, you should be able to:
1. Identify basic plots and visualizations that can be created using Matplotlib, Seaborn, and Plotly.
2. Explain the purpose of different visualization techniques in data analysis.
3. Apply visualization techniques to create plots from datasets.
4. Interpret visualizations to draw meaningful conclusions.

## Key Ideas
- Visualization is the graphical representation of data.
- Visualizations help us understand patterns, trends, distributions, relationships, and outliers.
- The module covers Matplotlib, Seaborn, and Plotly.
- Matplotlib is lower-level and flexible.
- Seaborn is built on Matplotlib and is useful for statistical graphics.
- Plotly is useful for interactive visualizations.

## Matplotlib
Matplotlib is a low-level Python visualization library based on NumPy arrays.

Install:

```python
pip install matplotlib
```

Import:

```python
import matplotlib.pyplot as plt
```

### Figure
A figure is the full space where plots are drawn.

```python
fig = plt.figure(facecolor="red", figsize=(20, 10))
```

Useful parameters:
- `figsize`: width and height of the figure.
- `facecolor`: background color.
- `edgecolor`: edge color.

### Line Plot
Use `plot()` to create a line plot. Line plots are useful for showing trends over time or continuous data.

```python
import matplotlib.pyplot as plt

months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
]
temperatures = [0, 2, 5, 9, 14, 18, 22, 21, 17, 11, 5, 1]

fig = plt.figure(figsize=(15, 10))
plt.plot(months, temperatures)
plt.title("Months vs Temperature")
plt.ylabel("Temperature")
plt.xlabel("Months")
```

### Bar Graph
Use `bar()` to compare categories.

```python
fig, ax = plt.subplots(figsize=(10, 6), dpi=100)
ax.bar(months, temperatures, color="skyblue")
ax.set_title("Average Monthly Temperature")
ax.set_xlabel("Month")
ax.set_ylabel("Temperature (C)")
plt.xticks(rotation=90)
plt.show()
```

### Box Plot
A box plot displays a distribution using the minimum, first quartile, median, third quartile, and maximum. It is useful for spread and outliers.

```python
data = pd.read_csv("IRIS.csv")
data_box = data[["species", "sepal_length"]]
data_box.boxplot()
```

### Violin Plot
A violin plot shows distribution and density. It gives more detail than a box plot because it shows the kernel density estimate.

```python
plt.violinplot(data["sepal_length"])
```

Violin plots are useful for distribution shape, spread, skewness, multimodal distributions, ranges, and outliers.

## Seaborn
Seaborn is a statistical visualization library based on Matplotlib. It integrates easily with Pandas.

Install:

```python
pip install seaborn
```

Import:

```python
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
```

Seaborn features:
- simpler interface for plots,
- works well with DataFrames,
- good default themes and color palettes,
- complex statistical graphics with less code.

Common Seaborn plots:
- scatter plots for relationships between continuous variables,
- `lmplot()` for scatter plots with regression lines,
- heatmaps for matrix or correlation data,
- strip plots and swarm plots for categorical distributions.

## Plotly
Plotly is an open-source interactive plotting library.

Install:

```python
pip install plotly==5.21.0
```

Import:

```python
import pandas as pd
import plotly.express as px
```

Example scatter plot:

```python
fig = px.scatter(
    data,
    x="sepal_width",
    y="sepal_length",
    color="species"
)
fig.show()
```

Example box plot:

```python
px.box(data, y="sepal_width")
```

Example line plot:

```python
px.line(
    data,
    x="petal_width",
    y="petal_length",
    color="species",
    title="Petel legth vs petel width"
)
```

## Exam Reminders
- Matplotlib is flexible and lower-level.
- Seaborn is built on Matplotlib and is strong for statistical plots.
- Plotly is strong for interactive plots.
- Histogram: shows the distribution of a dataset.
- Bar graph: compares categories.
- Heatmap: best for matrix or correlation data.
- Line plot: best for trends over time.
- Violin plot: shows distribution shape and density.
- `lmplot()` adds a regression line to a scatter plot.

