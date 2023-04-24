Rails.application.routes.draw do
  resources :doctors, only: [:show]
  resources :appointments, only: [:destroy]
  resources :patients, only: [:index]
end
