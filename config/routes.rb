require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users
  
  root 'pages#index'
  get '/support', to: 'pages#support'
  resources :pages


  mount Sidekiq::Web => '/sidekiq'
end