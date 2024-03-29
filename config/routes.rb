Rails.application.routes.draw do

  get '/', to: 'ping#root'

  post 'login', to: 'authentication#login'
  post 'signup', to: 'users#create'

  get 'users', to: 'users#index'
  get 'users/current_car', to: 'users#current_car'
  get 'users/car_history', to: 'users#car_history'
  put 'users/price_tier', to: 'users#update_price_tier'

  get 'cars/car_types', to: 'car_types#index'
  get 'cars/car_classes', to: 'car_classes#index'
  get 'cars/price_tiers', to: 'price_tiers#index'

  post 'car_rentals', to: 'car_rentals#request_rental'
  get 'car_rentals/pending', to: 'car_rentals#rentals_pending'
  post 'car_rentals/confirm', to: 'car_rentals#confirm_rental'

  get 'upcoming_rentals/confirmed', to: 'car_rentals#upcoming_rentals_confirmed'
  get 'upcoming_rentals/all', to: 'car_rentals#upcoming_rentals_all'


  get 'client_token', to: 'payments#client_token'
  post 'process_checkout', to: 'payments#checkout'
end
