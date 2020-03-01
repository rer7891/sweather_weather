class WeatherForecast
  def initialize(forecast)
    @currently = forecast[:currently]
    @hourly = forecast[:hourly]
    @daily = forecast[:daily]
require "pry"; binding.pry
  end

  def currently
    @currently[:summary]
    @currently[:icon]
    @currently[:temperature]
  end

  def daily
    @daily[:summary][:data].first[:temperatureHigh]
    @daily[:summary][:data].first[:temperatureLow]
    @daily[:summary]
    @daily[:icon]
  end
end
