class Api::V1::RegistrationController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: {auth_token: user.auth_token}, status: :created
    else
      render json: {description: "User was not registered. Bad credentials."}, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
