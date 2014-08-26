Rails.application.routes.draw do
  root "home#show"
  resources :user
  resources :home


end
