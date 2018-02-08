Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'members/new'

  get 'members/index'

  resources :members


  resources :teams
  root 'teams#index'


  get 'teams/index'
  get 'teams/new'
end
