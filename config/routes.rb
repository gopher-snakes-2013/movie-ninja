MovieNinja::Application.routes.draw do
  resources :surveys, only: [:index, :new]

  get ':surveys/:survey_url', to: 'surveys#show', as: :survey

end