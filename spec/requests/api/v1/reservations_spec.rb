require 'rails_helper'

RSpec.describe "Api::V1::Reservations", type: :request do
  let(:current_user) { User.create!(email: 'james@abc.com', password: 'james123') }

  let(:doctor) do
    Doctor.create!(
      image: 'image_url_8',
      name: 'Dr. Jennifer Adams',
      specialization: 'Psychiatrist',
      consultation_fee: 190,
      hospital: 'Mindful Psychiatry Clinic',
      availability: false,
      description: 'Offers compassionate care for mental...',
      facebook: 'facebook.com/drjenniferadams',
      twitter: 'twitter.com/drjenniferadams',
      instagram: 'instagram.com/drjenniferadams'
    )
  end

  let(:reservation1) {
    current_user.reservations.create!(
      city: 'LA',
      time: '10:00',
      date: 'May 30, 2024',
      doctor: doctor
    )
  }

  path '/api/v1/reservations' do
    get 'View a user\'s reservations' do
      tags 'Reservations'
      parameter name: 'Authorization', in: :header, type: :string

      before { reservation1 }

      response 200, 'Successful' do
        let(:Authorization) { current_user.create_new_auth_token['Authorization'] }
        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body.length).to eq 1
          expect(body.first['city']).to eq reservation1.city
        end
      end

      response 401, 'Unauthorized' do
        let(:Authorization) { 'Bearer random...' }
        run_test!
      end
    end

    post 'Create a reservation' do
      tags 'Reservations'
      consumes 'application/json'

      parameter name: 'Authorization', in: :header, type: :string
      parameter name: 'reservation', in: :body, schema: {
        type: :object,
        properties: {
          city: { type: :string },
          time: { type: :string },
          date: { type: :string },
          doctor_id: { type: :number }
        },
        required: %i[city, time, date, doctor_id]
      }

      response 201, 'Created' do
        let(:Authorization) { current_user.create_new_auth_token['Authorization'] }
        let(:reservation) do
          {
            city: 'New York',
            time: '8:00',
            date: '4 Jun, 2024',
            doctor_id: doctor.id
          }
        end

        run_test!
      end

      response 401, 'Unauthorized' do
        let(:Authorization) { 'Bearer random...' }
        let(:reservation) do
          {
            city: 'New York',
            time: '8:00',
            date: '4 Jun, 2024',
            doctor_id: doctor.id
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'ID of a doctor'
    parameter name: 'Authorization', in: :header, type: :string

    delete 'Delete a reservation' do
      tags 'Reservations'

      before(:each) { reservation1 }

      response 204, 'No content' do
        let(:Authorization) { current_user.create_new_auth_token['Authorization'] }
        let(:id) { reservation1.id }
        run_test!
      end

      response 404, 'Not found' do
        let(:Authorization) { current_user.create_new_auth_token['Authorization'] }
        let(:id) { 0 }
        run_test!
      end

      response 401, 'Unauthorized' do
        let(:Authorization) { 'Bearer ...' }
        let(:id) { reservation1.id }
        run_test!
      end
    end
  end
end
