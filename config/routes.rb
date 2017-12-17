require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users
  
  root 'pages#index'
  get 'pages/support'
  get 'pages/contact'


  mount Sidekiq::Web => '/sidekiq'
end