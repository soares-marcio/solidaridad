require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users
  
  root 'pages#index'
  resources :pages


  mount Sidekiq::Web => '/sidekiq'
end