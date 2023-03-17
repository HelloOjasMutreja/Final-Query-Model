Rails.application.routes.draw do
  devise_for :users
  resources :options
  resources :queries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "queries#index"
end
