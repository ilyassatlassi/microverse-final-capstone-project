require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = User.create!(name: 'khan jan', email: 'khan1@gmail.com', password: '123456')
    @doctor = Doctor.create!(name: 'Dr.khan', specialization: 'dentist', consultation_fee: 100,
                             hospital: 'Kabul Afghan Clinic', description: 'dentalist prof', availability: true)
    @reservation = Reservation.create!(date: '2021-05-12', city: 'kabul', time: '12:00',
                                       user_id: @user.id, doctor_id: @doctor.id)
  end

  it 'should have a date' do
    expect(@reservation.date).to eq(@reservation.date)
  end
  it 'should have a city' do
    expect(@reservation.city).to eq(@reservation.city)
  end

  it 'should have a time' do
    expect(@reservation.time).to eq(@reservation.time)
  end

  it 'should have a user_id' do
    expect(@reservation.user_id).to eq(@user.id)
  end

  it 'should have a doctor_id' do
    expect(@reservation.doctor_id).to eq(@doctor.id)
  end

  it 'city should be equl or grater than 3 characters and less than 50' do
    expect(@reservation.city.length).to be >= 2
    expect(@reservation.city.length).to be <= 50
  end

  it 'should belong to a user' do
    expect(@reservation.user).to eq(@user)
  end

  it 'should belong to a doctor' do
    expect(@reservation.doctor).to eq(@doctor)
  end
end
