Rails.application.routes.draw do
  root 'fixed_pages#home'
  match '/about',    to: 'fixed_pages#about',    via: 'get'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
