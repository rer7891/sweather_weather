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
      user_response = JSON.parse(response.body)
    end

    it "can get error messages" do
      params = {
                  email: "sogood@example.com",
                  password: "not good"
                }
      post '/api/v1/sessions', params: params

      expect(response).to have_http_status(:error)
      new_user_response = JSON.parse(response.body)
    end
  end
end
