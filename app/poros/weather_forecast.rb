class WeatherForecast
  attr_accessor :id, :currently, :hourly, :daily

  def initialize(forecast)
    @id = nil
    @currently = forecast[:currently]
    @hourly = forecast[:hourly]
    @daily = forecast[:daily]
  end

  def currently
    @currently[:summary]
    @currently[:icon]
    @currently[:temperature]
  end

  def daily
    @daily[:data].first[:temperatureHigh]
    @daily[:data].first[:temperatureLow]
    @daily[:summary]
    @daily[:icon]
  end
end
