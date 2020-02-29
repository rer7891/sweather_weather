class WeatherForecast
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def get_forecast
    DarkSkyService.new(@coordinates)
  end 
end
