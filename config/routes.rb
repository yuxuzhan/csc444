Rails.application.routes.draw do

  get 'sponsors/new'
  get 'sponsors/index'
  post 'sponsors/create'
  get 'sponsors/show'

  get 'sponsorships/new'
  get 'sponsorships/index'
  post 'sponsorships/create'
  get 'sponsorships/show'

  get 'tournaments/show'
  get 'tournaments/edit'
  put 'tournaments/update'

  get 'profiles/show'
  get 'organizers/new'
  get 'organizers/show'
  post 'sub_admins/create'
  get 'sub_admins/show'
  #resources :players

  get 'organizers/show'

  post 'players/create'
  post 'players/update'
  get "players/show"

  get 'about_us/show'

  get 'tournaments/new'
  get 'tournaments/index'
  post 'tournaments/create'

  devise_for :accounts
  get "home/show" => "home#show"

  root :to => "home#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
