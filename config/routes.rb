Rails.application.routes.draw do
  devise_for :users
  get '/users/:user_id/bookings/:pet_id/accept', to: 'bookings#accept', as: 'accept_booking'
  get 'users/bookings/:id/confirmed', to: 'bookings#confirmation', as: 'confirm_booking'
  get 'users/bookings/cancelled', to: 'bookings#cancelled', as: 'cancelled_booking'
  get 'users/:user_id/management', to: 'users#management', as: 'pet_management'

  root to: 'pets#index'
  # get '/users/:user_id/bookings/:pet_id/accept', to: 'bookings#accept', as: 'accept_booking'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets, :users do
    resources :bookings
  end

#  resources :users, except: [:index, :destroy]
end
