class Forecaster
  attr_reader :location
  def initialize(location)
    @location = location
  end

  def get_coordinates
    Google.new(@location)
  end

  def get_weather
    WeatherForecast.new(get_coordinates)
  end



end
