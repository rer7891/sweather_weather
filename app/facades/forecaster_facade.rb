class ForecasterFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_coordinates
    GoogleService.new.geocode(@location)

  end

  def location
    coordinates = get_coordinates[:results]
    GoogleLocation.new(coordinates)
  end

  def get_weather
    forecast = DarkskyService.new.get_weather(location)
  end

  def weather
    WeatherForecast.new(get_weather, location.location)
  end
end
