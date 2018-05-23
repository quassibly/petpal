Rails.application.routes.draw do
  devise_for :users
  get '/users/:user_id/bookings/:pet_id/accept', to: 'bookings#accept', as: 'accept_booking'
  root to: 'pets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets, :users do
    resources :bookings
  end


#  resources :users, except: [:index, :destroy]
end
