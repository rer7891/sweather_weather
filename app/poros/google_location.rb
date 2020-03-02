class GoogleLocation
  attr_reader :lat, :lng, :location
  def initialize(coordinates)
    @location = coordinates[0][:formatted_address]
    @lat = coordinates[0][:geometry][:location][:lat]
    @lng = coordinates[0][:geometry][:location][:lng]
  end
end
