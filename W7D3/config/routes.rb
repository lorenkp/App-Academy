Rails.application.routes.draw do
  root to: 'root_controller#root'
  resources :posts
end
