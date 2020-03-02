class Yelp < Forecaster
  def initialize(details)
    @start_loc = details[0]
    @end_loc = details[1]
    @food = details[2]
  end

  def get_restaurant
    service = YelpService.new
    service.get_restaurant(travel_details, @food)
  end

  def get_travel_time
    service = GoogleService.new
    service.get_travel_time(@start_loc, @end_loc)
  end

  def travel_details
    GoogleTravelTime.new(get_travel_time)
  end
end
