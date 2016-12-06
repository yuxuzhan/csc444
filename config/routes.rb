Rails.application.routes.draw do
  devise_for :accounts
  root :to => "home#show"

  resources :home, only: [:show]
  resources :charges, :tournaments, :sponsors, :sponsorships
  resources :attachments, only: [:create, :destroy]

  get 'about_us', to: 'about_us#show'

  get 'contacts', to: 'contacts#new'
  post 'contacts', to: 'contacts#create'

  get 'term_of_service', to: 'term_of_service#show'

  get 'privacy_policy', to: 'privacy_policy#show'
  
  get 'features', to: 'features#show'

  get 'faq', to: 'faq#show'
  
  get 'partners', to: 'partner#show'
  
  post 'transactions/create'

  get 'profiles', to: 'profiles#show'

  get 'organizers/new'
  get 'organizers/show'
  get 'organizers/update'

  post 'sub_admins/create'
  get 'sub_admins/show'

  post 'players/create'
  post 'players/update'
  get "players/show"
end
