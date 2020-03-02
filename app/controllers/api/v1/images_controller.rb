class Api::V1::ImagesController < ApplicationController
  def show
    location = params[:location]
    render json: ImageSerializer.new(ImageFacade.new(location).get_image)
  end
end
