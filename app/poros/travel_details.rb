class TravelDetails
  attr_reader :id, :end_location, :travel_time, :forecast

  def initialize(travel, forecast, restaurant)
    @id = nil
    @end_location = travel.destination_name
    @travel_time = travel.travel_time
    @forecast = forecast.currently[:summary]
    @restaurant = restaurant
  end

  def restaurant
    restaurant = {}
    restaurant[:name] = @restaurant.name
    restaurant[:addres] = [@restaurant.address, ", ", @restaurant.city, ", ",@restaurant.state, " ", @restaurant.zip].join
    restaurant
  end
end
