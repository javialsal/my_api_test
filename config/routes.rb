Rails.application.routes.draw do
  resources :listings, only: ['index', 'show', 'create', 'update', 'delete']
  resources :missions, only: ['index']
end
