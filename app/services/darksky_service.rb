class DarkskyService
  def get_weather_forecast(travel_details)
    url = "forecast/#{key}/#{travel_details.lat},#{travel_details.lng},#{travel_details.time}"
    get_json(url)
  end

  def get_weather(coordinates)
    url = "forecast/#{key}/#{coordinates.lat},#{coordinates.lng}"
    get_json(url)
  end

private

  def key
    ENV['DARK_SKY_API_KEY']
  end

  def get_json(url)
    response = Faraday.get("https://api.darksky.net/#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
