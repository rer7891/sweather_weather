require 'rails_helper'

describe "can return a registered user" do

  describe "Post #create", :vcr do
    it "can create a new user" do

      params = {
                  email: "sogood@example.com",
                  password: "42652452",
                  password_confirmation: "42652452"
                }
      post '/api/v1/users', params: params

      expect(response).to have_http_status(:success)
      new_user_response = JSON.parse(response.body)
      user = User.last
      expect(new_user_response["auth_token"]).to eq(user.auth_token)
    end

    it "can get error messages" do

      params = {
                  email: "sogood@example.com",
                  password: "426523432",
                  password_confirmation: "42652452"
                }
      post '/api/v1/users', params: params

      expect(response).to have_http_status(401)
      new_user_response = JSON.parse(response.body)
      expect(new_user_response["description"]).to eq("User was not registered. Bad credentials.")
    end
  end
end
