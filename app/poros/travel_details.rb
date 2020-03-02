class TravelDetails
  def initialize(travel, forecast, restaurant)
    @end_location = travel.destination_name
    @travel_time = travel.travel_time
    @forecast = forecast.forecast_hourly[10]
    @restaurant = restaurant
  end

  def restaurant
    @restaurant
  end
end
