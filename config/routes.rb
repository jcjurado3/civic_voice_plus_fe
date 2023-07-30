Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get '/dashboard', to: 'users#index', as: 'dashboard'

  delete '/logout', to: 'sessions#destroy'

  post '/user_categories', to: 'user_categories#create'

  resources :users, only: [:show]
end
