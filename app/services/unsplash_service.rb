class UnsplashService
  def get_image_json(location)
    key = ENV['UNSPLASH_API_KEY']
    url = "search/photos?query=#{location[0]}&per_page=1&client_id=#{key}"
    get_json(url)
  end

private

  def get_json(url)
    response = Faraday.get("https://api.unsplash.com/#{url}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
