class DarkskyService
  def get_weather_forecast(travel_time)
    key = ENV['DARK_SKY_API_KEY']
    time = Time.now.to_i + travel_time.format_travel_time
    url = "forecast/#{key}/#{travel_time.lat},#{travel_time.lng},#{time}"
    get_json(url)
  end

  def get_weather(coordinates)
    key = ENV['DARK_SKY_API_KEY']
    url = "forecast/#{key}/#{coordinates.lat},#{coordinates.lng}"
    get_json(url)
  end

private

  def get_json(url)
    response = Faraday.get("https://api.darksky.net/#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
