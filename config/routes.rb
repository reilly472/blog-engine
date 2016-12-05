Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  
  resources :posts
  resources :snippets
  resources :click_trackers, path: 'r'
end
