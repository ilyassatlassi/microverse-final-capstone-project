Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :users,only: [:index] do
      resources :doctors, only: [:index, :create, :destroy]
  end
end
