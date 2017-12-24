require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :users,  path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'register' }


  root 'needies#index'
  resources :needies
  # resources :pages

  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
end