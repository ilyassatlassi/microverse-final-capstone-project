class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    @reservations = current_user.reservations.all
    render json: @reservations, status: :ok
  end

  def create
    doctor = Doctor.find(reservation_params[:doctor_id])

    @reservation = current_user.reservations.new(
      city: reservation_params[:city],
      date: reservation_params[:date],
      time: reservation_params[:time],
      doctor: doctor
    )

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: { message: 'An error occured', errors: @reservation.errors }, status: :not_created
    end
  end

  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy
    render status: :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Could not find the specified reservation' }, status: :not_found
  end

  def reservation_params
    params.require(:reservation).permit(:date, :city, :time, :doctor_id)
  end
end
