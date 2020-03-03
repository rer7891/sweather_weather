class TripFacade
  def initialize(trip_details)
    @start = trip_details[:origin]
    @destination = trip_details[:destination]
  end

  def travel_time
    service = GoogleService.new
    service.get_travel_time(@start, @destination)
  end

  def travel_details
    TravelDetails.new(travel_time)
  end

end
