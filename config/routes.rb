Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  # USER FLOW INCLUDED IN RESOURCES BELOW
  # get "/households/new", to: "households#new"
  # post "/households", to: "households#create"
  # get "/households", to: "households#index"
  # get "/user_households/new", to: "user_households#new"
  # get "/user_households", to: "user_households#create"
  # get "/households/household_id", to: "households#show"
  # get "/households/:household_id/household_movies", to: "household_movies#index"
  # get "/households/:household_id/household_movies/:household_movies_id", to: "household_movies#show"
  # USER 2 - experience
  # get "/households/household_id/household_movies", to: "household_movies#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :households do
    member do
      get "start_game", to: "households#start_game"
      get "random_pick", to: "households#random_pick"
    end
    resources :user_households, only: [:new, :create]
    resources :household_movies, only: [:index, :show, :create]
  end
  resources :user_households, only: :destroy
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
