Rails.application.routes.draw do

  resources :members
  resources :scores
  resources :rounds
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'members/new'
  get 'members/index'
  get 'teams/index'
  get 'teams/new'

  root 'teams#index'
end
