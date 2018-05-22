Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets, :users do
    resources :bookings, except: [:index]
  end

#  resources :users, except: [:index, :destroy]
end
