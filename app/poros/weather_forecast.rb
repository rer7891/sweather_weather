class WeatherForecast
  require 'date'
  require 'time'

  attr_reader :id, :location, :time_zone

  def initialize(forecast, location)
    @id = nil
    @currently = forecast[:currently]
    @hourly = forecast[:hourly]
    @daily = forecast[:daily]
    @location = location
    @time_zone = forecast[:timezone]
  end

  def forecast_currently
    forecast_currently = {}
    forecast_currently[:time] = DateTime.strptime("#{@currently[:time]}", '%s')
    forecast_currently[:today_summary] = @currently[:summary]
    forecast_currently[:icon] = @currently[:icon]
    forecast_currently[:temperature] = @currently[:temperature]
    forecast_currently[:hummidity] = @currently[:hummidity]
    forecast_currently[:apparentTemperature] = @currently[:apparentTemperature]
    forecast_currently[:visibility] = "#{@currently[:visibility].to_f.round(2)} miles"
    forecast_currently[:uvIndex] = uvindex(@currently[:uvIndex])
    forecast_currently[:temperatureHigh] = @daily[:data].first[:temperatureHigh]
    forecast_currently[:temperatureLow] = @daily[:data].first[:temperatureLow]
    forecast_currently[:tonight_summary] = @hourly[:data][7][:summary]
    forecast_currently
  end

  def uvindex(index)
    uvindex = {}
    uvindex[0..2] = "#{index} (low)"
    uvindex[3..5] = "#{index} (moderate)"
    uvindex[6..8] = "#{index} (high)"
    uvindex[8..10] = "#{index} (very high)"
    uvindex[11..13] = "#{index} (extreme)"
    uvindex[index..(index + 2)]
  end

  def forecast_hourly
    hour = 0
    @keys = [:time, :temperature, :summary, :icon]
    forecast_hourly = @hourly[:data].map do |hourly|
      time = Time.at(hourly[:time].to_i)
      time = hourly[:time] = time.strftime("%I %p")
      hourly = hourly.select { |key, value| @keys.include?(key) }
    end
    forecast_hourly.first(8)
  end

  def forecast_daily
    forecast_daily = {}
    @keys = [:time, :temperatureHigh, :temperatureLow, :humidity, :summary, :icon]
    forecast_daily = @daily[:data].map do |daily|
      daily = daily.select { |key, value| @keys.include?(key) }
    end
    forecast_daily.first(5)
  end

  def trip_forecast
    { temp: @currently[:temperature], summary: @currently[:summary] }
  end
end
