Rails.application.routes.draw do
  get 'results/index'

  get 'members/new'
  get 'members/index'
  get 'members_deactivate' => 'members#deactivate'
  get 'teams/index'
  get 'teams/new'
  get "day_path" => "rounds#show"
  get 'team_destroy' => 'teams#destroy'
  get "round_path" => "rounds#inRound"
  get "day_results_path" => "day_results#index"
  get "day_results_day_path" => "day_results#dayIndex"
  resources :members
  resources :scores
  resources :rounds
  resources :teams
  resources :results
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'rounds#index'
end
