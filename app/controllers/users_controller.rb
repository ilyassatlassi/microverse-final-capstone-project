class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, only: %i[name email id]
  end
end
