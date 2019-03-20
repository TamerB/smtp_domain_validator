Rails.application.routes.draw do

  resources :validation_requests, only: [:index, :create]

  root 'validation_requests#index'
end
