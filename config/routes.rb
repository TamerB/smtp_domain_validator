Rails.application.routes.draw do

  namespace :api, constraints: { format: 'json' } do
    resources :validation_requests, only: [:create]
  end

  resources :validation_requests, only: [:index, :create]

  root 'validation_requests#index'
end
