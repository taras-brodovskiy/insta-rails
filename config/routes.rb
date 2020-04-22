Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users  

  resources :instaposts, except: [:edit, :update, :destroy]

end
