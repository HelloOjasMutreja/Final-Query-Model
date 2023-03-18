Rails.application.routes.draw do
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users

  resources :queries do
    resources :options do
      get :random, on: :collection
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "queries#index"
end
