require 'rails_helper'

describe "can return a user" do

  describe "POST #create", :vcr do
    before :each do
      params = {
                  email: "sogood@example.com",
                  password: "42652452",
                  password_confirmation: "42652452"
                }
      post '/api/v1/users', params: params
      @user = User.last
    end

    it "can create a session for a user" do

      params = {
                  email: "sogood@example.com",
                  password: "42652452"
                }

      post '/api/v1/sessions', params: params

      expect(response).to have_http_status(:success)
      new_user_response = JSON.parse(response.body)["data"]
      expect(new_user_response["attributes"]["api_key"]).to eq(@user.auth_token)
    end

    it "can get error messages" do
      params = {
                  email: "sogood@example.com",
                  password: "not good"
                }
      post '/api/v1/sessions', params: params

      expect(response).to have_http_status(401)
      new_user_response = JSON.parse(response.body)
      expect(new_user_response["description"]).to eq("Login Failed. Bad credentials.")
    end
  end
end
