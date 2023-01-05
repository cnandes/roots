Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :gardens do
    resources :beds, only: %i[new create show edit update]
  end
  resources :veggies, only: %i[new create index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
