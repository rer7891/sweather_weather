class GoogleTravelTime
  attr_reader :lat, :lng, :travel_time, :destination_name, :origin_name
  def initialize(data)
    @lat = data[:routes][0][:legs][0][:end_location][:lat]
    @lng = data[:routes][0][:legs][0][:end_location][:lng]
    @travel_time = data[:routes][0][:legs][0][:duration][:text]
    @destination_name = data[:routes][0][:legs][0][:end_address]
    @origin_name = data[:routes][0][:legs][0][:start_address]
  end
end
