Rails.application.routes.draw do

  post 'login', to: 'authentication#login'
  post 'signup', to: 'users#create'

  get 'users', to: 'users#index'
  get 'users/current_car', to: 'users#current_car'
  get 'users/car_history', to: 'users#car_history'

  get 'cars/car_types', to: 'car_types#index'
  get 'cars/car_classes', to: 'car_classes#index'
  get 'cars/price_tiers', to: 'price_tiers#index'

  post 'car_rentals', to: 'car_rentals#request_rental'
end
