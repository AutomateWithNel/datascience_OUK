---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: 9
source_files:
  - [[../01 Source Materials/Handling time series data (1).pdf]]
  - [[../01 Source Materials/Module 09 - Handling Time Series Data - Moodle Extract]]
tags:
  - source-backed
  - dsc201
  - module-09
  - time-series
  - pandas
---

# Module 09 - Handling Time Series Data

## Source
- [[../01 Source Materials/Handling time series data (1).pdf]]
- [[../01 Source Materials/Module 09 - Handling Time Series Data - Moodle Extract]]

## Learning Outcomes
By the end of this module, you should be able to:
1. Describe the fundamental concepts and tools for handling time series data, including date and time data types, date ranges, frequencies, and time zone handling.
2. Explain the significance and applications of resampling and frequency conversion in time series analysis.
3. Apply shifting and moving window functions to manipulate and analyze time series data.
4. Interpret time series data after applying techniques such as resampling and moving window functions.

## Key Ideas
- Time series data is data recorded over a period of time.
- Time series analysis is important in areas such as finance, economics, and environmental science.
- Python handles date and time values using the `datetime` module.
- Pandas provides tools for date ranges, frequencies, missing values, resampling, shifting, and moving windows.

## Date And Time
The `datetime` module is commonly used for handling date and time data in Python.

```python
import datetime

today = datetime.date.today()
print(today)
```

`timedelta` represents the difference between two date or datetime values.

```python
from datetime import datetime, timedelta

start = datetime(2026, 6, 1)
end = start + timedelta(days=7)
print(end)
```

## Formatting Dates
The `strftime()` method formats dates as strings.

Common format specifiers:
- `%Y` gives the four-digit year.
- `%m` gives the two-digit month.
- `%d` gives the two-digit day.

```python
from datetime import date

today = date.today()
print(today.strftime("%Y-%m-%d"))
```

## Date Ranges And Frequencies
Pandas can create date ranges with `pd.date_range()`.

```python
import pandas as pd

dates = pd.date_range("2026-01-01", periods=5)
print(dates)
```

Frequency controls how the dates are spaced.

```python
dates = pd.date_range("2026-01-01", periods=5, freq="D")
print(dates)
```

`freq="BME"` generates the last business day of each month.

```python
dates = pd.date_range("2026-01-01", periods=5, freq="BME")
print(dates)
```

## Missing Values In Time Series
Forward fill uses the last valid value to fill missing values.

```python
df = df.ffill()
```

## Resampling
Resampling converts a time series from one frequency to another.

Converting higher frequency data to lower frequency is called downsampling.

```python
monthly_sales = data.resample("M").sum()
```

## Shifting
Shifting moves data forward or backward through time.

```python
data["Previous Sales"] = data["Sales"].shift(1)
data["Next Sales"] = data["Sales"].shift(-1)
```

Moving data backward or forward through time is called shifting.

## Moving Window Functions
Moving window functions calculate values over a rolling window.

```python
data["Moving Average"] = data["Sales"].rolling(window=3).mean()
```

## Exam Reminders
- Time series data is recorded over time.
- Use `datetime` for date and time values.
- `timedelta` represents the difference between two datetime values.
- `%Y` means four-digit year.
- `ffill()` propagates the last valid value forward.
- Downsampling converts higher frequency data to lower frequency.
- Resampling converts time series data from one frequency to another.
- Shifting moves time series data backward or forward through time.
- `freq="BME"` gives the last business day of each month.
