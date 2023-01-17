Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'upcoming-gardens', to: 'pages#upcoming_gardens', as: :upcoming_gardens

  resources :gardens, only: %i[create index show edit update destroy] do
    resources :beds, only: %i[new create show]
  end

  resources :beds, only: %i[edit update destroy]
  resources :crops, only: %i[create update destroy] do
    member do
      get :plant
      get :harvest
    end
  end

  resources :veggies, only: %i[create index]
end
