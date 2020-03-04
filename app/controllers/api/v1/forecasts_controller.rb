class Api::V1::ForecastsController < ApplicationController
  def index
    location = params[:location]
    render json: ForecasterSerializer.new(ForecasterFacade.new(location).weather)
  end
end
