class DarkskyService

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
