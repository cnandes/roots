Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :gardens

  resources :beds, only: %i[edit update]
  resources :crops, only: %i[create destroy]
  resources :veggies, only: %i[new create index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
