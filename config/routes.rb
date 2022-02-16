Rails.application.routes.draw do
  root "posts#index"
  resources :posts
  resources :users, param: :username
  get 'login', to: 'user_sessions#new', as: 'login'
  post 'login', to: "user_sessions#create"
  delete 'logout', to: 'user_sessions#destroy', as: 'logout'
end
