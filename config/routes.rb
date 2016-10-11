Rails.application.routes.draw do
  resources :sponsors
  get 'profiles/show'
  get 'organizers/new'
  #resources :players

  post 'players/create'
  get "players/show"


  get 'tournaments/new'
  get 'tournaments/index'
  post 'tournaments/create'

  devise_for :accounts
  get "home/show" => "home#show"

  root :to => "home#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
