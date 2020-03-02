class Forecaster
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_coordinates
    location_details = GoogleService.new.geocode(@location)
    coordinates = location_details[:results]
    @location_object = GoogleLocation.new(coordinates)
  end

  def get_weather
    forecast = DarkskyService.new.get_weather(get_coordinates)
    WeatherForecast.new(forecast, @location_object.location)
  end
end
