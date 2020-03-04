require 'rails_helper'

describe "Weather Forecaster", :vcr do
  before :each do
    forecaster = ForecasterFacade.new("denver,co")
    forecast = forecaster.get_weather
    @weather = WeatherForecast.new(forecast, "denver,co")
  end

  it "can initialize with details" do
    expect(@weather.forecast_currently[:time]).to_not eq(nil)
    expect(@weather.forecast_daily.first[:summary]).to_not eq(nil)
    expect(@weather.forecast_hourly.first[:summary]).to_not eq(nil)
  end
end
