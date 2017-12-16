require 'sidekiq/web'

Rails.application.routes.draw do

  root 'pages#index'
  get 'pages/support'
  get 'pages/contact'

  namespace :admin do
  end
  # mount Fae below your admin namespec
  mount Fae::Engine => '/admin'

  mount Sidekiq::Web => '/sidekiq'
end