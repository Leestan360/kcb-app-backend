Rails.application.routes.draw do
  resources :devices, only: [:index, :create, :show, :destroy, :update]
  resources :transactions, only: [:index, :create, :show, :destroy, :update]
  resources :accounts, only: [:index, :create, :show, :destroy, :update]
  resources :users, only: [:index, :show, :destroy, :update]
  resources :roles, only: [:index, :create, :show, :destroy, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/signup", to: "users#create"

end
