Rails.application.routes.draw do
  root "home#homepage"
  resources :home
  resources :login
  resources :user
  resources :register
  resources :how
  resources :contact


end
