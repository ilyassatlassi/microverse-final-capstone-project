class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def reservations
    user = User.includes(:reservations).find(params[:user_id])
    render json: user.reservations
  end
end
