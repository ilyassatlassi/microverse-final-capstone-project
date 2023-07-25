require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(name: 'khan', email: 'khan@gmail.com', password: '123456') }

  before { subject.save }

  it 'should have a name' do
    expect(subject.name).to eq('khan')
  end

  it 'should have an email' do
    expect(subject.email).to eq('khan@gmail.com')
  end

  it 'should have a password' do
    expect(subject.password).to eq('123456')
  end

  it 'should have many reservations' do
    expect(subject.reservations).to eq([])
  end

  it 'name, email, and password should be equal to or greater than 3 characters' do
    expect(subject.name.length).to be >= 3
    expect(subject.email.length).to be >= 3
    expect(subject.password.length).to be >= 3
  end
end
