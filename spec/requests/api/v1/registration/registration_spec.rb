require 'rails_helper'

describe "can return a registered user" do

  describe "Post #create", :vcr do
    it "can create a new user" do

      params = {
                  email: "whatever@example.com",
                  password: "password",
                  password_confirmation: "password"
                }
      post '/api/v1/users', params: params

      expect(response).to have_http_status(:success)
      new_user_response = JSON.parse(response.body)
    end
  end
end
