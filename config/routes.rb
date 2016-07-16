Rails.application.routes.draw do
  root to: "posts#index"

  resources :posts, only: [:new, :create, :show, :index]
  resources :articles, only: [:new, :create, :show, :index]
  resources :comments, only: :create
end
