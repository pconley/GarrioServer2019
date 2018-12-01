require 'sidekiq/web'

Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do 
      resources :users,     only: [:index, :show], :defaults => { :format => 'json' }
      resources :languages, only: [:index, :show], :defaults => { :format => 'json' }
    end 
  end 

  namespace :admin do
      resources :users
      resources :languages
      resources :announcements
      resources :notifications
      resources :services

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
