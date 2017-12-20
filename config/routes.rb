require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users
  
  root 'pages#index'
  resources :needies


  mount Sidekiq::Web => '/sidekiq'
end