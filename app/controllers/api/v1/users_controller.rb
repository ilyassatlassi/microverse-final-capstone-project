class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def current
    render json: current_user
  end
end
