class ImageFacade
  attr_reader :location, :id

  def initialize(location)
    @id = nil
    @location = location
  end

  def split_location
    @location.split(",")
  end

  def get_image
    service = UnsplashService.new
    json = service.get_image_json(split_location)
  end

  def define_image
    Image.new(get_image)
  end
end
