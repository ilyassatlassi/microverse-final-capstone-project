require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject do
    Doctor.create!(name: 'khan', specialization: 'dentist', consultation_fee: 100, hospital: 'Kabul Afghan Clinic',
                   description: 'dentalist prof', availability: true)
  end

  before { subject.save }

  it 'should have a name' do
    expect(subject.name).to eq('khan')
  end

  it 'should have a specialization' do
    expect(subject.specialization).to eq('dentist')
  end

  it 'should have a consultation fee' do
    expect(subject.consultation_fee).to eq(100)
  end

  it 'should have a hospital' do
    expect(subject.hospital).to eq('Kabul Afghan Clinic')
  end

  it 'should have a description' do
    expect(subject.description).to eq('dentalist prof')
  end

  it 'should have a boolean availability' do
    expect(subject.availability).to eq(true)
  end

  it 'name, specialization, hospital, and description should be equal to or greater than 3 characters and less than or equal to 50 characters' do
    expect(subject.name.length).to be >= 3
    expect(subject.specialization.length).to be >= 3
    expect(subject.hospital.length).to be >= 3
    expect(subject.description.length).to be >= 3
    expect(subject.name.length).to be <= 50
    expect(subject.specialization.length).to be <= 50
    expect(subject.hospital.length).to be <= 50
    expect(subject.description.length).to be <= 50
  end

  it 'should have many reservations' do
    expect(subject.reservations).to eq([])
  end
end
