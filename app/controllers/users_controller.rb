class UsersController < ApplicationController
  def index
    @users = User.includes(:reservations).all
    render json: @users, only: %i[name email id]
  end
end
