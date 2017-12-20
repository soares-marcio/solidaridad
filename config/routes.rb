require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users
  
  root 'pages#index'
  resources :needies, only: [:index, :create]
  resources :pages

  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
end