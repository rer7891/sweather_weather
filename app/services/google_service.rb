class GoogleService

  def get_travel_time(start_loc, end_loc)
    key = ENV['GOOGLE_API_KEY']
    url = "directions/json?origin=#{start_loc}&destination=#{end_loc}&key=#{key}"
    get_json(url)
  end

  def geocode(location)
    key = ENV['GOOGLE_API_KEY']
    url = "geocode/json?address=#{location}&key=#{key}"
    get_json(url)
  end

private

  def get_json(url)
    response = Faraday.get("https://maps.googleapis.com/maps/api/#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
