Rails.application.routes.draw do
  resources :posts, only: [:show, :index] do
    resources :comments, only: :create
  end

  resources :articles, only: [:show, :index] do
    resources :comments, only: :create
  end
end
