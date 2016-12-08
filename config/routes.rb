Rails.application.routes.draw do
  resources :users, path: 'n', only: [:create]
  
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  
  root to: 'posts#index'
  
  resources :users, except: [:create]
  
  resources :posts
  resources :snippets
  resources :click_trackers, path: 'r'
  resources :images
  resources :products
  resources :downloads
  
  get '/n', to: 'users#index'
end