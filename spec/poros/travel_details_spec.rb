require 'rails_helper'

describe "Travel Details", :vcr do
  before :each do
  travel = GoogleService.new.get_travel_time("Denver,CO", "Pueblo,CO")
  @details = TravelDetails.new(travel[:routes])
  end
  it "can initialize with details" do
    expect(@details.lat).to eq(38.2542053)
    expect(@details.lng).to eq(-104.6087488)
    expect(@details.trip_time).to eq("1 hour 48 mins")
  end
end
