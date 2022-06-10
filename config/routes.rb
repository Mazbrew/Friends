Rails.application.routes.draw do
  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#homepage"

  get "signup" ,to: "users#new"
  resources :users, except: [:new]
  
  get "login" , to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  resources :posts
  get "userposts", to:"posts#userposts"
  
end
