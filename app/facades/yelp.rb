class Yelp < Forecaster
  def initialize(details)
    @start_loc = details[0]
    @end_loc = details[1]
    @food = details[2]
  end

  def get_restaurant
    service = YelpService.new
    @restaurant ||= service.get_restaurant(travel_details, @food)
    YelpDetails.new(@restaurant)
  end

  def get_travel_time
    service = GoogleService.new
    service.get_travel_time(@start_loc, @end_loc)
  end

  def travel_details
    @travel ||= GoogleTravelTime.new(get_travel_time)
  end

  def get_forecast
    @forecast ||= DarkskyService.new.get_weather_forecast(travel_details)
    WeatherForecast.new(@forecast, @end_loc)
  end

  def final_details
    TravelDetails.new(travel_details, get_forecast, get_restaurant)
  end
end
