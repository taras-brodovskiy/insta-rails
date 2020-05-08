Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users

  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
    resources :instaposts, except: [:edit, :update, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :relationships, only: [:create, :destroy]

end
