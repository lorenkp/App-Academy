Rails.application.routes.draw do
  resources :posts, except: [:index, :destroy]
  resources :subs, except: [:destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :users
end
