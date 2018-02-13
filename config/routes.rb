Rails.application.routes.draw do
  get 'results/index'

  get 'members/new'
  get 'members/index'
  get 'teams/index'
  get 'teams/new'
  get 'team_destroy' => 'teams#destroy'
  get "round_path" => "rounds#inRound"
  resources :members
  resources :scores
  resources :rounds
  resources :teams
  resources :results
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'rounds#index'
end
