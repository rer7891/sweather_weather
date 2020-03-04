require 'rails_helper'

describe "Google Locations", :vcr do
  before :each do
    location_details = GoogleService.new.geocode("pueblo,co")
    coordinates = location_details[:results]
    @location = GoogleLocation.new(coordinates)
  end
  it "can initialize with details" do

    expect(@location.lat).to eq(38.2544472)
    expect(@location.lng).to eq(-104.6091409)
    expect(@location.location).to eq("Pueblo, CO, USA")
  end
end
