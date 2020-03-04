class TripFacade
  attr_reader :id, :destination, :origin
  def initialize(trip_details)
    @id = nil
    @origin = trip_details[:origin].downcase
    @destination = trip_details[:destination].downcase
  end

  def travel_time
    service = GoogleService.new
    service.get_travel_time(@origin, @destination)
  end

  def travel_details
    @trip ||= TravelDetails.new(travel_time[:routes])
  end

  def get_trip_weather
    service = DarkskyService.new
    service.get_weather_forecast(travel_details)
  end

  def trip_forecast
    weather = WeatherForecast.new(get_trip_weather, @destination)
    weather.trip_forecast
  end

  def trip_duration
    travel_details.trip_time
  end
end
