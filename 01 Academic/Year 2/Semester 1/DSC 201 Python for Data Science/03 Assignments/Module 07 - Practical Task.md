---
type: practical-task
course_code: DSC 201
course_title: Python for Data Science
module: 7
source: user-provided Moodle prompt
status: draft
tags:
  - dsc201
  - module-07
  - practical
  - groupby
  - aggregation
---

# Module 07 - Practical Task

## Prompt

Dataset: `sales_data_records.csv`

The dataset contains sales transactions for a retail store with columns such as:
- `Transaction ID`
- `Date`
- `Product ID`
- `Product Name`
- `Category`
- `Quantity Sold`
- `Unit Price`
- `Total Sales`
- `Customer ID`
- `Region`

Tasks:
1. Group the data by product category and region to calculate:
   - total sales per category in each region,
   - average sales per transaction for each category in each region.
2. Group the data by date and region to find:
   - daily total sales in each region,
   - number of transactions per day in each region.
3. Calculate the overall total sales, average sales, and total number of transactions for each product category.
4. Identify the top 5 products by total sales in each region.
5. Determine the most profitable region based on total sales.
6. Calculate the monthly sales trend for each product category.

## Submission Note

Requested file: `sales_data_records.csv`

Submit one Python script. The runnable draft is [[Module7Practical.py]].

## Dataset Check

The saved CSV has 1,000 rows and these columns:

```text
Transaction ID, Date, Product Name, Category, Quantity Sold, Unit Price, Total Sales, Customer ID, Region
```

The Moodle prompt mentions `Product ID`, but the saved CSV does not include that column. The draft code does not require `Product ID`.

## Draft Answer

```python
import pandas as pd

csv_file = "sales_data_records.csv"

data = pd.read_csv(csv_file)

category_region_sales = data.groupby(["Category", "Region"])["Total Sales"].agg(["sum", "mean"])
print(category_region_sales)

daily_region_sales = data.groupby(["Date", "Region"])["Total Sales"].agg(["sum", "count"])
print(daily_region_sales)

category_summary = data.groupby("Category")["Total Sales"].agg(["sum", "mean", "count"])
print(category_summary)

product_region_sales = data.groupby(["Region", "Product Name"])["Total Sales"].sum().reset_index()
top_products = product_region_sales.sort_values(["Region", "Total Sales"], ascending=[True, False]).groupby("Region").head(5)
print(top_products)

region_sales = data.groupby("Region")["Total Sales"].sum()
print(region_sales.idxmax())
print(region_sales.max())

data["Date"] = pd.to_datetime(data["Date"], dayfirst=True)
data["Month"] = data["Date"].dt.to_period("M")
monthly_sales_trend = data.groupby(["Month", "Category"])["Total Sales"].sum()
print(monthly_sales_trend)
```
