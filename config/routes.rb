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

      resources :websites do
        collection do
          post :add_url
        end
      end

      resources :feeds, only: %i[index show] do
        member do
          put :favorit
          put :read
          put :bookmark
          get 'comments', to: 'feeds#comment_list'
          post :comment
        end
      end
    end
  end
end
