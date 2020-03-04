 # Sweater Weather
 A backend micro service for an app that plans road trips. The app will allow users to see the current weather as well as the forecasted weather at the destination and travel time to the destination. It exposes the following endpoints for consumption:

* /api/v1/users - allows a user to register with the app
* /api/v1/sessions - allows a user to login with the app
* /api/v1/forecast - provides a forecast for the destination
* /api/v1/backgrounds - provides a background image for the FE
* /api/v1/road_trip - provides travel time and weather to a destination.

#### This service consumes the following third party api's:

* Google Maps
* Google Geocoding
* Darksky Forecasts
* Unsplash Images

All endpoints are JSON 1.0 compliant and use the FastJson serializer.

#### Deployed Version
[Link To Deployed Heroku App](https://dashboard.heroku.com/apps/sweater-weather-robran)
