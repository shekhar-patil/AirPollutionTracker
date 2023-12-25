require 'sidekiq/web'

Rails.application.routes.draw do
  resources :cities, only: [:index, :show]
  mount Sidekiq::Web => '/sidekiq'
end
