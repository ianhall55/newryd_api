Rails.application.routes.draw do

  # resources :users, only: [:index, :create]
  # resource :session, only: [:create, :destroy]

  post 'login', to: 'authentication#login'
  post 'signup', to: 'users#create'

  get 'users', to: 'users#index'
end
