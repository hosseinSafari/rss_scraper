Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :accounts do
        collection do
          post :register
          get :login
          get :logout
        end
      end
    end
  end
end
