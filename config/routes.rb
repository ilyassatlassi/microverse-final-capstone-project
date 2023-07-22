Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
      resources :doctors, only: [:index, :create, :destroy]
      end
    end
  end
end
