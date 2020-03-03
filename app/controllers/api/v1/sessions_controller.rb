class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if login_successful?(user)
      session[:user_id] = user.id
      render json: body: {auth_token: user.auth_token}, status: :created
    else
      render json: body: {description: "Login Failed. Bad credentials."}, status: :unauthorized
    end
  end

  private

  def login_successful?(user)
    user && user.authenticate(params[:password])
  end
end
