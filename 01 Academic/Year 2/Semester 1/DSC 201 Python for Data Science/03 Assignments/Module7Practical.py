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
