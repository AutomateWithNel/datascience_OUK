import requests
import pandas as pd

# Define your API key
api_key = 'f4aaacf29976bba0a688d364c5e511c3'

# Define the API endpoint
base_url = 'https://api.openweathermap.org/data/2.5/weather'

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

    # Set up the parameters dictionary
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
    print(f'URL: {response.url}')

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
        print(f'Failed to retrieve data: {response.status_code}')
        # Print the response text for debugging
        print(response.text)

# Store the collected data in a Pandas DataFrame
data = pd.DataFrame(weather_list)

# Save the DataFrame to a CSV file
data.to_csv('kenya_weather_data.csv', index=False)

# Perform a simple analysis to find the city with the highest temperature
if len(data) > 0:
    highest_temperature = data.loc[data['Temperature'].idxmax()]

    print('\nWeather Data')
    print(data)

    print('\nCity with the highest temperature')
    print(highest_temperature[['City', 'Temperature']])

    # Create a report summarizing the weather conditions for each city
    print('\nWeather Report')
    for index, row in data.iterrows():
        print(
            f"{row['City']} has {row['Description']} with a temperature of "
            f"{row['Temperature']}°C, humidity of {row['Humidity']}%, "
            f"pressure of {row['Pressure']} hPa and wind speed of {row['Wind Speed']} m/s."
        )
else:
    print('No weather data was collected. Check that the API key is correct and active.')
