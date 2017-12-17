require 'sidekiq/web'

Rails.application.routes.draw do

  root 'pages#index'
  get 'pages/support'
  get 'pages/contact'


  mount Sidekiq::Web => '/sidekiq'
end