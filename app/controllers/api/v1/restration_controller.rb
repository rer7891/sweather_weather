class Api::V1::RegistrationController < ApplicationController
  def create
    require "pry"; binding.pry
    render json: RegistrationSerializer.new(new_user(params))
  end

  private

  def new_user
  end
end
