class ForecastsController < ApplicationController
  def index
    location = params[:location]
    render json: ForecasterSerializer.new(Forcaster.new(location))
  end
end
