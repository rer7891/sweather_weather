require 'rails_helper'

describe "Images", :vcr do
  before :each do
    data = ImageFacade.new("denver,co").get_image
    @image = Image.new(data)
  end

  it "can initialize with details" do
    expect(@image.url).to_not eq(nil)
  end
end
