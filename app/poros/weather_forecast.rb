class WeatherForecast
  require 'date'

  attr_reader :id, :location

  def initialize(forecast)
    @id = nil
    @currently = forecast[:currently]
    @hourly = forecast[:hourly]
    @daily = forecast[:daily]
    @location = forecast[:timezone]
  end

  def forecast_currently
    forecast_currently = {}
    forecast_currently[:time] = DateTime.strptime("#{@currently[:time]}", '%s')
    forecast_currently[:summary] = @currently[:summary]
    forecast_currently[:icon] = @currently[:icon]
    forecast_currently[:temperature] = @currently[:temperature]
    forecast_currently[:hummidity] = @currently[:hummidity]
    forecast_currently[:apparentTemperature] = @currently[:apparentTemperature]
    forecast_currently[:visibility] = "#{@currently[:visibility].to_f.round(2)} miles"
    forecast_currently[:uvIndex] = uvindex(@currently[:uvIndex])
    forecast_daily[:temperatureHigh] =  @daily[:data].first[:temperatureHigh]
    forecast_daily[:temperatureLow] = @daily[:data].first[:temperatureLow]
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
    forecast_hourly = {}
    hour = 0
    @keys = [:time, :temperature, :summary, :icon]
    @hourly[:data].each do |hourly|
      time = Date.strptime("#{hourly[:time]}", '%s')
      time = hourly[:time] = time.strftime("%I %p")
      hourly = hourly.select { |key, value| @keys.include?(key) }
      forecast_hourly[time] = hourly
    end
    forecast_hourly.first(8)
  end

  def forecast_daily
    forecast_daily = {}
    forecast_daily[:summary] = @daily[:summary]
    forecast_daily[:icon] = @daily[:icon]
    forecast_daily
  end
end
