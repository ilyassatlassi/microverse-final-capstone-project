require 'rails_helper'

RSpec.describe 'Api::V1::Reservations', type: :request, latest: true do
  let(:current_user) { User.create!(email: 'james@abc.com', password: 'james123') }

  path '/auth' do
    post 'Register a new user' do
      tags 'Users'
      consumes 'multipart/form-data'
      produces 'application/json'

      parameter name: :'', in: :formData, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          nickname: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: %i[name email password]
      }

      response 200, 'Successful' do
        let(:'') do
          {
            name: 'John Doe',
            nickname: 'Johnny',
            email: 'johndoe@gmail.com',
            password: 'johndoe100'
          }
        end
        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body['status']).to eq 'success'
          expect(body['data']['email']).to eq 'johndoe@gmail.com'
        end
      end

      response 422, 'Incomplete credentials' do
        let(:'') do
          {
            name: 'John Doe',
            nickname: 'Johnny',
            email: 'johndoe@gmail.com',
            password: nil
          }
        end
        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body['status']).to eq 'error'
        end
      end
    end
  end

  path '/auth/sign_in' do
    post 'Sign a user in' do
      tags 'Users'
      consumes 'application/x-www-form-urlencoded'
      produces 'application/json'

      parameter name: :'', in: :formData, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %i[email password]
      }

      before { current_user }

      response 200, 'Successful' do
        let(:'') do
          {
            email: 'james@abc.com',
            password: 'james123'
          }
        end

        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body['data']['email']).to eq current_user.email
        end
      end

      response 401, 'Invalid credentials' do
        let(:'') do
          {
            email: 'james@abc.com',
            password: 'blahblahblah'
          }
        end
        run_test!
      end
    end
  end

  path '/auth/sign_out' do
    delete 'Sign a user out' do
      tags 'Users'

      parameter name: 'Authorization', in: :header, type: :string

      before { current_user }

      response 200, 'Successful' do
        let(:Authorization) { current_user.create_new_auth_token['Authorization'] }
        run_test!
      end

      response 404, 'Not found' do
        let(:Authorization) { 'Bearer random...' }
        run_test!
      end
    end
  end
end
