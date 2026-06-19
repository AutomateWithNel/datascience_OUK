import os
import pandas as pd

# Define paths to source files (using relative paths from 03 Assignments)
source_dir = os.path.join("..", "01 Source Materials", "Module 05 - Data Wrangling")

jan_path = os.path.join(source_dir, "january_sales.csv")
feb_path = os.path.join(source_dir, "february_sales.csv")
prod_path = os.path.join(source_dir, "products.csv")

# Load datasets
print("Loading datasets...")
jan_df = pd.read_csv(jan_path)
feb_df = pd.read_csv(feb_path)
prod_df = pd.read_csv(prod_path)

# Task 1: Combine the two datasets (January and February Sales)
print("\n--- Task 1: Combining January and February Sales datasets ---")
combined_df = pd.concat([jan_df, feb_df], ignore_index=True)
print(f"Combined DataFrame shape: {combined_df.shape}")
print("First 5 rows of combined sales:")
print(combined_df.head())

# Task 2: Display the total sales for each product
print("\n--- Task 2: Total Sales (Sales Amount) per Product ---")
# Group by product_id and sum the sales_amount
total_sales = combined_df.groupby("product_id")["sales_amount"].sum().reset_index()
print(total_sales)

# Task 3: Merge the products dataset with the concatenated dataset using product_id
print("\n--- Task 3: Merging Combined Sales with Products Metadata ---")
merged_df = pd.merge(combined_df, prod_df, on="product_id", how="inner")
print(f"Merged DataFrame shape: {merged_df.shape}")
print("First 5 rows of merged sales with product details:")
print(merged_df.head())
