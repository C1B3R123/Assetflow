# backend/config/routes.rb

Rails.application.routes.draw do
  namespace :api do
    resources :notifications, only: [] do
      collection do
        get :expiring_licenses
      end
    end
    namespace :v1 do
      resources :assets
      resources :licenses
      resources :loans
      resources :maintenances

      # Rota para notificações de licenças expirando
      get 'notifications/expiring_licenses', to: 'notifications#expiring_licenses'
    end
  end
end
