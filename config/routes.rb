Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
      resources :doctors, only: [:index, :create, :destroy]
      end
    end
  end
end
