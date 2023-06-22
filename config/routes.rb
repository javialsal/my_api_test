Rails.application.routes.draw do
  resources :listings, only: ['index', 'show', 'create', 'update', 'delete']
  resources :reservations
  resources :bookings
end
