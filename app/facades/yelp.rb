class Yelp < Forecaster
  def initialize(details)
    @start_loc = details[0]
    @end_loc = details[1]
    @food = details[2]
  end

  def get_restaurant
    service = GoogleService.new
    service.get_travel_time(@start_loc, @end_loc)
    require "pry"; binding.pry
  end
end
