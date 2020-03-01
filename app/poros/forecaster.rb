class Forecaster
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_coordinates
    location_details = GoogleService.new.geocode(@location)
    coordinates = location_details[:results].first[:geometry][:location]
    lat = coordinates[:lat]
    lng = coordinates[:lng]
    GoogleLocation.new(lat, lng)
  end

  def get_weather
    forecast = DarkskyService.new.get_weather(get_coordinates)
    WeatherForecast.new(forecast)
  end
end
