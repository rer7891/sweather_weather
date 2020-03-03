class Api::V1::TripsController < ApplicationController
  def create

    if !validate_user
      TripFacade.new
    else
      response.status = 401
      render json: {description: "Unauthorized"}
    end
  end

  private

  def validate_user
    user = User.find_by(auth_token: params[:api_key])
    user.nil?
  end
end
