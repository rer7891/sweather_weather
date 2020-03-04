class Api::V1::TripsController < ApplicationController
  def create

    if !validate_user
      render json: TripsSerializer.new(TripFacade.new(trip_params))
    else
      response.status = 401
      render json: {description: "Unauthorized"}
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination)
  end

  def validate_user
    user = User.find_by(auth_token: params[:api_key])
    user.nil?
  end
end
