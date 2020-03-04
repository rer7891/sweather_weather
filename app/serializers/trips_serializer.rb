class TripsSerializer
  include FastJsonapi::ObjectSerializer
    set_type :trip_details
    attributes :destination, :origin, :trip_forecast, :trip_duration
end
