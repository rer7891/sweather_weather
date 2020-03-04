require 'rails_helper'

describe "can return weather forcasts and trip details" do

  describe "POST /api/v1/road_trip", :vcr do
    before :each do
      @user = User.create(email: "sogood@gmail.com", password: "1234", password_confirmation: "1234")
      @api_key = @user.auth_token
    end
    it "sends a list of weather details for a specific time and location" do
      allow(Time).to receive(:now).and_return(Time.parse('2020-03-02 11:22:54 -0700'))

      params = {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "api_key": "#{@api_key}"
                }

      post '/api/v1/road_trip', params: params

      expect(response).to have_http_status(:success)
      trip = JSON.parse(response.body)
      expect(trip["data"]["attributes"]["destination"]).to eq("pueblo,co")
      expect(trip["data"]["attributes"]["origin"]).to eq("denver,co")
      expect(trip["data"]["attributes"]["trip_duration"]).to eq("1 hour 48 mins")
    end

    it "sends an error if a user is not registered" do

      params = {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "api_key": "52464151452"
                }

      post '/api/v1/road_trip', params: params

      expect(response).to have_http_status(401)
      error = JSON.parse(response.body)
      expect(error["description"]).to eq("Unauthorized")
    end
  end
end
