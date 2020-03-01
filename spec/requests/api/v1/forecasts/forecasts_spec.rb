require 'rails_helper'

describe "can return weather forcasts" do

  describe "GET #index", :vcr do
    it "sends a list of weather details" do

      get '/api/v1/forecast?location=denver,co'
      expect(response).to have_http_status(:success)
      forecast = JSON.parse(response.body)
require "pry"; binding.pry
    end
  end

  # describe "GET #show" do
  #   it "returns finds Single Merchant API" do
  #
  #     merchant_id = create(:merchant).id
  #
  #     get "/api/v1/merchants/#{merchant_id}"
  #     merchant = JSON.parse(response.body)['data']
  #     expect(response).to have_http_status(:success)
  #     expect(merchant["id"]).to eq(merchant_id.to_s)
  #   end
  # end

  # describe "GET find query params" do
  #   it "finds a merchant by query params" do
  #     merchant_3 = create(:merchant, name: "Becky Robran")
  #
  #     get "/api/v1/for/find?name=Becky Robran" #merchant 3
  #       expect(response).to have_http_status(:success)
  #       merchant = JSON.parse(response.body)['data']['attributes']
  #       expect(merchant["name"]).to eq(merchant_3.name)
  #   end
  # end

  # describe 'API can return a random Merchant' do
  #   it "finds a random merchant" do
  #      merchant_array = create_list(:merchant, 50)
  #
  #     get "/api/v1/merchants/random"
  #     expect(response).to have_http_status(:success)
  #     merchant = JSON.parse(response.body)['data']['attributes']
  #     first_merchant = merchant_array.find {|merchant| merchant.name == merchant["name"]}
  #
  #     get "/api/v1/merchants/random"
  #     merchant_2 = JSON.parse(response.body)['data']['attributes']
  #     expect(merchant_2["name"]).not_to eq(first_merchant.name)
  #   end
  # end
end
