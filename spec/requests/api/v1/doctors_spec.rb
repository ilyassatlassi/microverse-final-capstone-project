require 'swagger_helper'

RSpec.describe 'API::V1::Doctors', type: :request do
  let(:current_user) { User.create!(email: 'james@abc.com', password: 'james123') }
  let(:admin) { User.create!(email: 'admin@gmail.com', password: 'admin123', role: 'admin') }
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

  path '/api/v1/doctors' do
    get 'List all doctors' do
      tags 'Doctors'

      before do
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
        Doctor.create!(
          image: 'image_url_9',
          name: 'Dr. William Roberts',
          specialization: 'General Surgeon',
          consultation_fee: 180,
          hospital: 'City General Hospital',
          availability: true,
          description: 'Experienced in various surgical...',
          facebook: 'facebook.com/drwilliamroberts',
          twitter: 'twitter.com/drwilliamroberts',
          instagram: 'instagram.com/drwilliamroberts'
        )
        Doctor.create!(
          image: 'image_url_10',
          name: 'Dr. Elizabeth Turner',
          specialization: 'Endocrinologist',
          consultation_fee: 210,
          hospital: 'Metabolic Health Clinic',
          availability: true,
          description: 'Specializes in hormone-related disorders...',
          facebook: 'facebook.com/drelizabethturner',
          twitter: 'twitter.com/drelizabethturner',
          instagram: 'instagram.com/drelizabethturner'
        )
      end

      parameter name: 'Authorization', in: :header, type: :string

      response 200, 'Successful' do
        let(:Authorization) { current_user.create_new_auth_token['Authorization'] }
        run_test! do |response|
          expect(JSON.parse(response.body).length).to eq 3
        end
      end

      response 401, 'Unauthorized' do
        let(:Authorization) { 'Bearer random...' }
        run_test!
      end
    end

    post 'Create a doctor' do
      tags 'Doctors'
      consumes 'application/json'

      parameter name: 'Authorization', in: :header, type: :string
      parameter name: 'doctor', in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          image: { type: :string },
          specialization: { type: :string },
          consultation_fee: { type: :number },
          hospital: { type: :string },
          availability: { type: :boolean },
          facebook: { type: :string },
          instagram: { type: :string },
          twitter: { type: :string }
        },
        required: %i[name description specialization]
      }

      response 201, 'Created' do
        let(:Authorization) { admin.create_new_auth_token['Authorization'] }
        let(:doctor) do
          {
            name: 'Matt',
            description: 'Highly specialized dentist',
            image: 'https://...',
            specialization: 'Dentist',
            consultation_fee: 300,
            hospital: 'Jones Medical',
            availability: true
          }
        end

        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body['message']).to eq 'Doctor created successfully'
        end
      end

      response 401, 'Unauthorized' do
        let(:Authorization) { 'Bearer random...' }
        let(:doctor) do
          {
            name: '...',
            description: '...',
            specialization: '...'
          }
        end
        run_test!
      end

      response 401, 'Unauthorized' do
        let(:Authorization) { current_user.create_new_auth_token['Authorization'] }
        let(:doctor) do
          {
            name: '...',
            description: '...',
            specialization: '...'
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'ID of a doctor'
    parameter name: 'Authorization', in: :header, type: :string

    get 'Show a doctor\'s details' do
      tags 'Doctors'

      response 200, 'Successful' do
        let(:Authorization) { current_user.create_new_auth_token['Authorization'] }
        let(:id) { doctor.id }
        run_test! do |response|
          JSON.parse(response.body)
          expect(JSON.parse(response.body)['name']).to eq doctor.name
        end
      end

      response 404, 'Not found' do
        let(:Authorization) { current_user.create_new_auth_token['Authorization'] }
        let(:id) { 0 }
        run_test!
      end

      response 401, 'Unauthorized' do
        let(:Authorization) { 'Bearer random...' }
        let(:id) { doctor.id }
        run_test!
      end
    end

    delete 'Delete a doctor' do
      tags 'Doctors'

      response 204, 'No content' do
        let(:Authorization) { admin.create_new_auth_token['Authorization'] }
        let(:id) { doctor.id }
        run_test!
      end

      response 404, 'Not found' do
        let(:Authorization) { admin.create_new_auth_token['Authorization'] }
        let(:id) { 0 }
        run_test!
      end

      response 401, 'Unauthorized' do
        let(:Authorization) { current_user.create_new_auth_token['Authorization'] }
        let(:id) { doctor.id }
        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body['message']).to eq 'Access denied'
        end
      end
    end
  end
end
