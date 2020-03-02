require 'rails_helper'

describe "can return a restaurant in a certain city" do

  describe "GET #show", :vcr do
    it "sends a chinese restaurant recommendation" do

      get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'
      expect(response).to have_http_status(:success)
      forecast = JSON.parse(response.body)
    end
  end
end
