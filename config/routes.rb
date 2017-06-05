Rails.application.routes.draw do

  # resources :users, only: [:index, :create]
  # resource :session, only: [:create, :destroy]

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
