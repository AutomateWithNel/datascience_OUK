---
type: practical-task
course_code: DSC 201
course_title: Python for Data Science
module: Module 3 - Data Loading and File Formats in Pandas
source: user-provided Moodle prompt
status: draft
---

# Module 3 Practical Task

## Prompt

You have been hired by the Kenya Metrological department as a Data scientist. The ICT manager has tasked you with analyzing weather data for major cities in Kenya. You are required to gather, process, and store the data using various data formats and tools available in Pandas.

Tasks:
1. Use the OpenWeatherMap API to fetch current weather data for Nairobi, Mombasa, Kisumu, Nakuru, and Eldoret. Store the collected data in a Pandas DataFrame.
2. Save the DataFrame to a CSV file.
3. Perform a simple analysis to find the city with the highest temperature.
4. Create a report summarizing the weather conditions for each city.

## Submission Note

Maximum number of files is 1, so submit one Python script. The runnable script is [[Module3Practical.py]].

## Draft Answer

This version mirrors the course material: define `api_key`, define `base_url`, define `lat`, `lon`, `exclude`, define `params`, call `requests.get(base_url, params=params)`, check `response.status_code`, parse `response.json()`, then store the extracted values in a Pandas DataFrame. The only extension is repeating the same pattern for the five cities required by the practical task.

```python
import requests
import pandas as pd

# Define your API key
api_key = "YOUR_API_KEY_HERE"

# Define the API endpoint
base_url = "https://api.openweathermap.org/data/2.5/weather"

# Define the cities and their parameters
cities = [
    ['Nairobi', -1.2921, 36.8219],
    ['Mombasa', -4.0435, 39.6682],
    ['Kisumu', -0.0917, 34.7680],
    ['Nakuru', -0.3031, 36.0800],
    ['Eldoret', 0.5143, 35.2698]
]

weather_list = []

for city in cities:
    city_name = city[0]
    lat = city[1]
    lon = city[2]
    exclude = 'minutely,hourly'

    # Define the parameters
    params = {
        'lat': lat,
        'lon': lon,
        'exclude': exclude,
        'units': 'metric',
        'appid': api_key,
    }

    # Make the GET request to the API
    response = requests.get(base_url, params=params)

    # Print the full URL for debugging
    print(f"URL: {response.url}")

    # Check if the request was successful
    if response.status_code == 200:
        # Parse the JSON response
        weather_data = response.json()

        # Extract relevant information
        current_temp = weather_data['main']['temp']
        humidity = weather_data['main']['humidity']
        pressure = weather_data['main']['pressure']
        description = weather_data['weather'][0]['description']
        wind_speed = weather_data['wind']['speed']

        weather_list.append({
            'City': city_name,
            'Temperature': current_temp,
            'Humidity': humidity,
            'Pressure': pressure,
            'Description': description,
            'Wind Speed': wind_speed
        })

        print(f'The current temperature in {city_name} is {current_temp}°C with {description}')
    else:
        print(f"Failed to retrieve data: {response.status_code}")
        print(response.text)

# Store the collected data in a Pandas DataFrame
data = pd.DataFrame(weather_list)

# Save the DataFrame to a CSV file
data.to_csv("kenya_weather_data.csv", index=False)

if len(data) > 0:
    # Find the city with the highest temperature
    highest_temperature = data.loc[data["Temperature"].idxmax()]

    print("\nWeather Data")
    print(data)

    print("\nCity with the highest temperature")
    print(highest_temperature[["City", "Temperature"]])

    # Create a report summarizing the weather conditions for each city
    print("\nWeather Report")
    for index, row in data.iterrows():
        print(
            f"{row['City']} has {row['Description']} with a temperature of "
            f"{row['Temperature']}°C, humidity of {row['Humidity']}%, "
            f"pressure of {row['Pressure']} hPa and wind speed of {row['Wind Speed']} m/s."
        )
else:
    print("No weather data was collected. Check that the API key is correct and active.")
```

## Notes

- The course material uses latitude and longitude in the OpenWeatherMap request, so this answer keeps that pattern and repeats it for the five cities.
- The city coordinates were added to complete the practical task. They are approximate city coordinates, not copied from the Moodle notes.
- The CSV output file is `kenya_weather_data.csv`.
- The highest-temperature analysis uses `idxmax()` on the `Temperature` column.
- The report is printed in the terminal so the submission remains one Python file.

## Successful Run Result

Weather data collected:

| City | Temperature | Humidity | Pressure | Description | Wind Speed |
| --- | ---: | ---: | ---: | --- | ---: |
| Nairobi | 22.06 | 54 | 1014 | broken clouds | 2.84 |
| Mombasa | 27.60 | 63 | 1015 | few clouds | 7.63 |
| Kisumu | 25.45 | 59 | 1011 | few clouds | 2.78 |
| Nakuru | 25.49 | 44 | 1012 | few clouds | 3.17 |
| Eldoret | 22.24 | 49 | 1013 | scattered clouds | 3.67 |

City with the highest temperature:

```text
Mombasa - 27.6°C
```

Weather report:

```text
Nairobi has broken clouds with a temperature of 22.06°C, humidity of 54%, pressure of 1014 hPa and wind speed of 2.84 m/s.
Mombasa has few clouds with a temperature of 27.6°C, humidity of 63%, pressure of 1015 hPa and wind speed of 7.63 m/s.
Kisumu has few clouds with a temperature of 25.45°C, humidity of 59%, pressure of 1011 hPa and wind speed of 2.78 m/s.
Nakuru has few clouds with a temperature of 25.49°C, humidity of 44%, pressure of 1012 hPa and wind speed of 3.17 m/s.
Eldoret has scattered clouds with a temperature of 22.24°C, humidity of 49%, pressure of 1013 hPa and wind speed of 3.67 m/s.
```
