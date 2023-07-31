Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get '/dashboard', to: 'users#index', as: 'dashboard'

  delete '/logout', to: 'sessions#destroy'

  resources :bills, only: [:index, :show] do
    get '/page/:page', action: :index, on: :collection
  end

  resources :user_bills, only: [:index]
end
