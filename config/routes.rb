Rails.application.routes.draw do
  root "home#splash"
  devise_for :users
  resources :categories do
    resources :payments, only: [:new, :create, :destroy]
    resources :categories_payments, only: [:show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
