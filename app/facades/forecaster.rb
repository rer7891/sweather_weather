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
  end

  def weather
    WeatherForecast.new(get_weather, @location_object.location)
  end
end
