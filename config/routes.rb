Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'teams/new'

  get 'teams/index'

  resources :teams
  root 'teams#index'

  get 'members/new'

  get 'members/index'

  resources :members
  root 'members#index'

end
