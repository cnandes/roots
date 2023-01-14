Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard", as: :dashboard

  resources :gardens do
    resources :beds, only: %i[new create show]
  end

  resources :beds, only: %i[edit update destroy]
  resources :crops, only: %i[create destroy]

  resources :veggies, only: %i[create index]
end
