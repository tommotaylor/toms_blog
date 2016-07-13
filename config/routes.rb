Rails.application.routes.draw do
  resources :posts, except: :destroy do
    resources :comments, only: :create
  end
end
