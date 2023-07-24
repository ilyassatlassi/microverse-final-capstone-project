class Api::V1::DoctorsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @doctors = Doctor.includes(:reservations)
    render json: { status: 'SUCCESS', message: 'Loaded all doctors', data: @doctors }, status: :ok
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: { status: 'SUCCESS', message: 'Doctor created successfully', data: @doctor }, status: :created
    else
      render json: { status: 'ERROR', message: 'Doctor creation failed', data: @doctor.errors },
             status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    render json: { status: 'SUCCESS', message: 'Doctor deleted successfully', data: @doctor }, status: :ok
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :image, :specialization, :consultation_fee, :hospital,
                                   :availability, :description, :facebook, :twitter, :instagram)
  end
end
