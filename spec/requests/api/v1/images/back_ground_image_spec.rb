require 'rails_helper'

require 'rails_helper'

describe "can return a background image" do

  describe "GET images#show", :vcr do
    it "sends a background image for specific location" do

      get "/api/v1/backgrounds?location=denver,co"
      expect(response).to have_http_status(:success)
      image = JSON.parse(response.body)["data"]["attributes"]
      expect(image.keys).to eq(["url"])
    end
  end
end
