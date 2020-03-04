class TravelDetails
  attr_reader :destination, :trip_time, :time, :lat, :lng
  def initialize(details)
    @destination = details[0][:legs][0][:end_address]
    @lat = details[0][:legs][0][:end_location][:lat]
    @lng = details[0][:legs][0][:end_location][:lng]
    @trip_time = details[0][:legs][0][:duration][:text]
    @trip_time_in_sec = details[0][:legs][0][:duration][:value]
    @time = Time.now.to_i + @trip_time_in_sec
  end
end
