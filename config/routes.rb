Rails.application.routes.draw do

  resources :attachments, only: [:create, :destroy]
  resources :charges
  resources :tournaments

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

  post 'transactions/create'
  get 'profiles', to: 'profiles#show'

  get 'organizers/new'
  get 'organizers/show'
  get 'organizers/update'
  post 'sub_admins/create'
  get 'sub_admins/show'
  #resources :players

  get 'organizers/show'

  post 'players/create'
  post 'players/update'
  get "players/show"

  get 'about_us', to: 'about_us#show'

  get 'contacts', to: 'contacts#new'
  post 'contacts', to: 'contacts#create'


  devise_for :accounts
  get "home/show" => "home#show"

  root :to => "home#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
