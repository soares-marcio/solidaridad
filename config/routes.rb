require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users
  
  root 'pages#index'
  get :needies, to: 'pages#needies'
  resources :pages

  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
end