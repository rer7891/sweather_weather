class Api::V1::RegistrationController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: {body: {auth_token: user.auth_token}, status: "Success 200."}
    else
      render json: {description: "User was not registered. Bad credentials.", response: "Error 404"}
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
