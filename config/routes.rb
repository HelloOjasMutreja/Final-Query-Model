Rails.application.routes.draw do
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users

  resources :queries do
    member do
      post :transfer
    end
    resources :options do
      get :random, on: :collection
    end
  end

  resources :options, only: [:create, :update, :destroy]

  resources :daily_queries do
    resources :options do
      get :random, on: :collection
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "queries#index"
end