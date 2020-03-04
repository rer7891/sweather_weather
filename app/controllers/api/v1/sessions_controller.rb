class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if login_successful?(user)
      session[:user_id] = user.id
      response.status = 200
      render json: {auth_token: user.auth_token}
    else
      response.status = 401
      render json: {description: "Login Failed. Bad credentials."}
    end
  end

  private

  def login_successful?(user)
    user && user.authenticate(params[:password])
  end
end
