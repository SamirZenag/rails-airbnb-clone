Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars, except: [:destroy] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [] do
      resources :reviews, only: :create
  end
  # resources :reviews, only: [:create]
  # post 'bookings/:booking_id/reviews', to: 'reviews#create', as: :booking_reviews
  get 'dashboard/listings', to: 'dashboard#listings'
  get 'dashboard/rentals', to: 'dashboard#rentals'

  get '/bookings/:id/accept', to: 'bookings#accept'
  get '/bookings/:id/decline', to: 'bookings#decline'

end
