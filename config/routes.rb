Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'plans', to: 'pages#plans', as: :plans
  get 'history', to: 'pages#history', as: :history

  resources :gardens, only: %i[create index show edit update destroy] do
    resources :beds, only: %i[new create show edit update]
  end

  resources :beds, only: %i[ destroy] do
    resources :crops, only: %i[create]
  end
  resources :crops, only: %i[update destroy] do
    member do
      get :plant
      get :harvest
    end
  end

  resources :veggies, only: %i[create index]
end
