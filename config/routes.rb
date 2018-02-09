Rails.application.routes.draw do

  resources :members
  resources :scores
  resources :rounds
  root 'rounds#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
