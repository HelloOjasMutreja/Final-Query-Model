Rails.application.routes.draw do
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users

  resources :daily_queries, only: [:index, :create, :destroy]
  post 'queries/:id/add_to_daily_list', to: 'queries#add_to_daily_list', as: :add_to_daily_list_query

  resources :queries do
    resources :options do
      get :random, on: :collection
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "queries#index"
end
