require 'rails_helper'

describe "can return weather forcasts" do

  describe "GET #index", :vcr do
    it "sends a list of weather details" do

      get '/api/v1/forecast?location=denver,co'
      expect(response).to have_http_status(:success)
      forecast = JSON.parse(response.body)
    end
  end
end
