Rails.application.routes.draw do
  root "home#splash"
  devise_for :users
  resources :categories, only: [:index, :show, :new, :create] do
    resources :payments, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
