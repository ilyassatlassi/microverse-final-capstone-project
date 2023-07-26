class Api::V1::DoctorsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def index
    @doctors = Doctor.all
    render json: @doctors, status: :ok
  end

  def show
    @doctor = Doctor.includes(:reservations).find(params[:id])
    render json: @doctor, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Could not find the specified doctor ' }, status: :not_found
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
    render status: :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Could not find the specified doctor' }, status: :not_found
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :image, :specialization, :consultation_fee, :hospital,
                                   :availability, :description, :facebook, :twitter, :instagram)
  end
end
