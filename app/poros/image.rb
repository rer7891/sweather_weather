class Image
  attr_reader :url, :id

  def initialize(data)
    @id = nil
    @url = data[:results][0][:urls][:full]
  end
end
