MovieNinja::Application.routes.draw do

  root to: "users#index"
  resources :users, only: [:index, :create]
  resources :sessions, only: [:create, :destroy]

end