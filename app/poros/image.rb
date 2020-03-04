class Image
  attr_reader :url

  def initialize(data)
    @url = data[:results][0][:urls][:full]
  end
end
