MovieNinja::Application.routes.draw do

  root to: "users#index"
  resources :users, only: [:index, :create, :show]
  resources :sessions, only: [:create, :destroy]
  resources :surveys, only: [:new, :create] do
    get 'confirm', to: 'confirmations#show', :as => :confirmation
    # get '/surveys/1/confirm', to: 'surveys#confirm', as: :confirm
  end

  get 'surveys/:survey_url', to: 'surveys#show', as: :survey # use friendly_id here?
end