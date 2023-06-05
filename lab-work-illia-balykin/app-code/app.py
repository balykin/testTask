import requests
from flask import Flask, Response

app = Flask(__name__)

# Helper function to get weather data from OpenWeatherMap API
def get_weather_data(city):
    url = 'https://api.openweathermap.org/data/2.5/weather'
    params = {'q': city, 'units': 'metric', 'appid': 'a6311858fb35df63b55216bae4aa952a'}

    # Send a GET request to the API
    response = requests.get(url, params=params)

    # Raise an exception if the request was not successful
    response.raise_for_status()

    # Parse the JSON response
    data = response.json()

    # Extract the relevant weather data
    temperature = data['main']['temp']
    description = data['weather'][0]['description']

    return f'The weather in {city} is {description} and the temperature is {temperature:.1f} °C.'

# Route handlers
@app.route('/ping')
def ping():
    return Response('PONG', status=200, mimetype='text/html')

@app.route('/')
def weather():
    city = 'London'
    weather_data = get_weather_data(city)
    return Response(f'<html><body><h1>{weather_data}</h1></body></html>', status=200, mimetype='text/html')

@app.route('/health')
def health():
    return Response('{"status": "HEALTHY"}', status=200, mimetype='application/json')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
