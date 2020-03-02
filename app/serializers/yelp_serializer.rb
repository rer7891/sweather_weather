class YelpSerializer
  include FastJsonapi::ObjectSerializer
  set_type :travel_details
  attributes :id, :end_location, :travel_time, :forecast

  attribute :restaurant do |object|
    object.restaurant
  end
end
