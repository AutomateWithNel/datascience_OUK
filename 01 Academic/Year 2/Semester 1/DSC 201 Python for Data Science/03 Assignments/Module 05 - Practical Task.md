---
type: practical-task
course_code: DSC 201
course_title: Python for Data Science
module: Module 5 - Data Wrangling
source: user-provided Moodle prompt
status: draft
---

# Module 5 Practical Task

## Prompt

You are provided with two datasets for sales made in january and sales made in february. You are required:
1. Combine the two datasets
2. Display the total sales for each product

You are then provided with an additional dataset called products with the following columns: `product_id`, `product_name`, `product_category`.
3. Merge the given dataset with the concatenated dataset using the `product_id`.

## Submission Note

Maximum number of files is 1, so submit one Python script. The runnable script is [[Module5Practical.py]].

## Draft Answer

This script loads the January and February CSV files, uses `pd.concat()` to merge them vertically along the row axis, aggregates `sales_amount` using `.groupby()` to calculate total sales per product, and then uses `pd.merge()` to link the combined transactions with `products.csv` on the `product_id` key.

```python
import pandas as pd

# Load datasets
jan_df = pd.read_csv("january_sales.csv")
feb_df = pd.read_csv("february_sales.csv")
prod_df = pd.read_csv("products.csv")

# Task 1: Combine the two datasets
combined_df = pd.concat([jan_df, feb_df], axis=0, ignore_index=True)
print(combined_df.head())

# Task 2: Display the total sales for each product
total_sales = combined_df.groupby(by="product_id", as_index=False)["sales_amount"].sum()
print(total_sales)

# Task 3: Merge the products dataset with the concatenated dataset using product_id
merged_df = pd.merge(combined_df, prod_df, on="product_id", how="inner", sort=True)
print(merged_df.head())
```

## Notes

* The sales data is combined vertically using `pd.concat` with `axis=0` (default) and `ignore_index=True` to reset the index across the combined dataset.
* Total sales per product are aggregated using `groupby('product_id')['sales_amount'].sum()`.
* Merging with the product catalog uses `pd.merge` with an `inner` join on `product_id` to include names and categories for matching transactions.
* Code should be simplified to coursework, not beautified by AI.

## Successful Run Result

Combined sales DataFrame shape: `(200, 4)`

Total Sales per Product (first 5 rows shown):
| product_id | sales_amount |
| ---: | ---: |
| 1 | 7786.65 |
| 2 | 5338.41 |
| 3 | 2391.17 |
| 4 | 9482.65 |
| 5 | 6595.55 |

Merged dataset head (first 5 rows):
| product_id | quantity_sold | sales_amount | month | product_name | product_category |
| ---: | ---: | ---: | --- | --- | --- |
| 13 | 14 | 727.69 | January | Product_13 | Clothing |
| 16 | 17 | 508.19 | January | Product_16 | Electronics |
| 1 | 8 | 749.85 | January | Product_1 | Books |
| 4 | 10 | 879.74 | January | Product_4 | Groceries |
| 4 | 1 | 977.97 | January | Product_4 | Groceries |
