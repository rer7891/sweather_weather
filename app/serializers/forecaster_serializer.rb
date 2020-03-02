class ForecasterSerializer
  include FastJsonapi::ObjectSerializer
  set_type :weather_forecast
  attributes :id, :location, :time_zone

  attribute :daily do |object|
    object.forecast_daily
  end

  attribute :currently do |object|
    object.forecast_currently
  end

  attribute :hourly do |object|
    object.forecast_hourly
  end
end
