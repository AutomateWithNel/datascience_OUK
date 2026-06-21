import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px

csv_file = "compact.csv"

data = pd.read_csv(csv_file)
data["date"] = pd.to_datetime(data["date"])

data = data.dropna(subset=["continent", "total_cases", "total_deaths"])

latest_data = data.sort_values("date").groupby("country").tail(1)

top_3_countries = latest_data.sort_values("total_cases", ascending=False).head(3)["country"]
top_10_cases = latest_data.sort_values("total_cases", ascending=False).head(10)
top_10_deaths = latest_data.sort_values("total_deaths", ascending=False).head(10)

top_3_data = data[data["country"].isin(top_3_countries)]

plt.figure(figsize=(12, 6))
for country in top_3_countries:
    country_data = top_3_data[top_3_data["country"] == country]
    plt.plot(country_data["date"], country_data["total_cases"], label=country)

plt.title("Trend of Confirmed Cases for Top 3 Countries")
plt.xlabel("Date")
plt.ylabel("Total Cases")
plt.legend()
plt.xticks(rotation=45)
plt.show()

plt.figure(figsize=(12, 6))
sns.barplot(data=top_10_cases, x="country", y="total_cases")
plt.title("Total Confirmed Cases for Top 10 Countries")
plt.xlabel("Country")
plt.ylabel("Total Cases")
plt.xticks(rotation=90)
plt.show()

fig = px.line(
    top_3_data,
    x="date",
    y="total_cases",
    color="country",
    title="Trend of Confirmed Cases for Top 3 Countries"
)
fig.show()

fig = px.bar(
    top_10_deaths,
    x="country",
    y="total_deaths",
    title="Total Deaths for Top 10 Countries"
)
fig.show()
