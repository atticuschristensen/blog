Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'users/new'
  root 'fixed_pages#home'
  
  match '/about',    to: 'fixed_pages#about',    via: 'get'
  
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
