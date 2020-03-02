class YelpService
  def get_restaurant(travel_data, food)
    time = Time.now.to_i + travel_data.travel_time
    url = "v3/businesses/search?location=#{travel_data.destination_name}&limit=1&term=#{food}&open_at=#{time}"
  end

  def get_json(url)
    key = EVN['YELP_API_KEY']
    conn = Faraday.new(url: "https://api.yelp.com/#{url}") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{key}"
      faraday.adapter Faraday.default_adapter
    end
  end
end
