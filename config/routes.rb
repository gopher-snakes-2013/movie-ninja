MovieNinja::Application.routes.draw do

  root to: "users#index"
  resources :users, only: [:index, :create, :show]
  resource :sessions, only: [:create, :destroy]
  resources :surveys, only: [:new, :create]
  resources :votes, only: [:create]

  get 'surveys/:survey_url', to: 'surveys#show', as: :survey
  get 'preview_movie', to: 'movies#show'
end