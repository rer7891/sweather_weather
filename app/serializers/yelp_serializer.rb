class YelpSerializer
  include FastJsonapi::ObjectSerializer
  set_type :munchies
  attributes :end_location, :travel_time, :forecast

  attribute :restaurant do |object|
    object.restaurant
  end
end
