class ForecasterSerializer
  include FastJsonapi::ObjectSerializer
set_type :weather_forecast
attributes :id, :hourly, :currently, :daily
end
