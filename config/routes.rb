Rails.application.routes.draw do
  resources :users
  resources :articles
  resources :sessions, only: %i[new create destroy]

  get 'users/new'
  get 'articles/new'
  root 'fixed_pages#home'

  match '/about', to: 'fixed_pages#about', via: 'get'

  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  match '/:username', to: 'users#show', via: 'get', as: 'by_username' # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
