class Api::V1::RegistrationController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      response.status = 200
      render json: {auth_token: user.auth_token}
    else
      response.status = 401
      render json: {description: "User was not registered. Bad credentials."}
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
