class GoogleTravelTime
  attr_reader :lat, :lng, :travel_time, :destination_name, :origin_name
  def initialize(data)
    @lat = data[:routes][0][:legs][0][:end_location][:lat]
    @lng = data[:routes][0][:legs][0][:end_location][:lng]
    @travel_time = data[:routes][0][:legs][0][:duration][:text]
    @destination_name = data[:routes][0][:legs][0][:end_address]
    @origin_name = data[:routes][0][:legs][0][:start_address]
  end

  def format_travel_time
    time = @travel_time.split(" ")
    hour_in_seconds = (((time[0].to_i) *60) * 60)
    min_in_seconds = ((time[2].to_i) * 60)
    hour_in_seconds + min_in_seconds
  end

  def format_destination
      name = @destination_name.split(" ")
      destination_name = name.delete_at(2)
      co = name[1].split(",")
      new_name = name.delete_at(1)
      name << co
      name.join.downcase
  end
end
