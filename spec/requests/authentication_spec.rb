require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:current_user) { User.create!(email: 'james@abc.com', password: 'james123') }

  context 'General Authentication' do
    it "doesn't give you anything if you don't log in" do
      get api_v1_current_user_path
      expect(response.status).to eq(401)
    end

    it 'gives you an authentication code if you are an existing user and you satisfy the password' do
      login
      expect(response.has_header?('access-token')).to eq(true)
    end

    it 'gives you a status 200 on signing in ' do
      login
      expect(response.status).to eq(200)
    end

    it 'first get a token, then access a restricted page' do
      login
      auth_params = get_auth_params_from_login_response_headers(response)
      get api_v1_current_user_path, headers: auth_params
      expect(response).to have_http_status(:success)
    end

    it 'deny access to a restricted page with an incorrect token' do
      login
      auth_params = get_auth_params_from_login_response_headers(response).tap do |h|
        h.each do |k, _v|
          h[k] = '123' if k == 'access-token'
        end
      end
      get api_v1_current_user_path, headers: auth_params
      expect(response).not_to have_http_status(:success)
    end
  end

  def login
    post new_user_session_path, params: { email: current_user.email, password: 'james123' }.to_json,
                                headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

  def get_auth_params_from_login_response_headers(response)
    client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid = response.headers['uid']

    {
      'access-token' => token,
      'client' => client,
      'uid' => uid,
      'expiry' => expiry,
      'token-type' => token_type
    }
  end
end
