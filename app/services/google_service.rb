class GoogleService

  def geocode(location)
    key = ENV['GOOGLE_API_KEY']
    url = "maps/api/geocode/json?address=#{location}&key=#{key}"
    get_json(url)
  end

private

  def get_json(url)
    response = Faraday.get("https://maps.googleapis.com/#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
