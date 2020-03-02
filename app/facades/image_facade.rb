class ImageFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def split_location
    @location.split(",")
  end

  def get_image
    service = UnsplashService.new
    json = service.get_image_json(split_location)
    Image.new(json)
  end

end
