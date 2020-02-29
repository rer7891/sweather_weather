class Google
  def initialize(data)
    @data = data
  end

  def get_coordinates
    service = GoogleService.new
    service.geocode(@data)
  end 
end
