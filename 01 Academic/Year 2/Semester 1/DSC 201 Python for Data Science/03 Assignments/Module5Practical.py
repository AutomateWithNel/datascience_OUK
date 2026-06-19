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
