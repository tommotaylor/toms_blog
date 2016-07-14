Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :show, :index] do
    resources :comments, only: :create
  end

  resources :articles, only: [:new, :create, :show, :index] do
    resources :comments, only: :create
  end
end
