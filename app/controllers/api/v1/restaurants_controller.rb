class Api::V1::RestaurantsController < ApplicationController
  def show
    start_loc = params[:start]
    end_loc = params[:end]
    food = params[:food]
    details = [start_loc, end_loc, food]

    Yelp.new(details).final_details
  end
end
