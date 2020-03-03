class TripFacade
  def initialize(trip_details)
    @start = trip_details[:origin]
    @destination = trip_details[:destination]
  end

  
end
