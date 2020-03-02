class YelpService
  def get_restaurant(travel_data, food)
    search_params = food + " " + "food"
    time = Time.now.to_i + travel_data.format_travel_time
    url = "v3/businesses/search?location=#{travel_data.format_destination}&limit=1&term=#{search_params}&open_at=#{time}"
    get_json(url)
  end

  def get_json(url)
    key = ENV['YELP_API_KEY']
    response = Faraday.get("https://api.yelp.com/#{url}") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{key}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
