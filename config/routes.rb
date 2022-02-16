Rails.application.routes.draw do
  root "posts#index"
  resources :posts
  resources :users
  get 'login', to: 'user_sessions#new', as: 'login' # ログイン画面用
  post 'login', to: "user_sessions#create" # ログイン処理用
  delete 'logout', to: 'user_sessions#destroy', as: 'logout' # ログアウト処理用
end
