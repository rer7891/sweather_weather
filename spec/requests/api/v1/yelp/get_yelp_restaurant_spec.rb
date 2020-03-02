require 'rails_helper'

describe "can return a restaurant in a certain city" do

  describe "GET #show", :vcr do
    it "sends a chinese restaurant recommendation" do

      get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'
      expect(response).to have_http_status(:success)
      travel_details = JSON.parse(response.body)

      expect(travel_details["data"]["attributes"]["end_location"]).to eq("Pueblo, CO, USA")
      expect(travel_details["data"]["attributes"]["travel_time"]).to eq("1 hour 48 mins")
      expect(travel_details["data"]["attributes"]["forecast"]).to eq("Clear")
      expect(travel_details["data"]["attributes"]["restaurant"]["name"]).to eq("Kan's Kitchen")
    end
  end
end
