Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :transportadors
  end
  namespace :admin do
    resources :clientes
  end
  namespace :admin do
    resources :clientes do
      member do
        get :simular_frete
      end
    end
    class ApplicationController < ActionController::Base
      # ... (métodos existentes)
    
      def after_sign_in_path_for(resource)
        case resource.role
        when 'admin'
          admin_dashboard_path
        when 'cliente'
          clientes_dashboard_path
        when 'transportador'
          transportadores_painel_path
        else
          root_path
        end
      end
    end
    Rails.application.routes.draw do
      devise_for :usuarios
    
      namespace :admin do
        namespace :admin do
          get 'dashboard', to: 'dashboard#index', as: :admin_dashboard_custom
        end
        
      end
    
      namespace :clientes do
        get 'dashboard', to: 'dashboard#index', as: :dashboard
        # Outras rotas de clientes
      end
    
      namespace :transportadores do
        get 'painel', to: 'painel#index', as: :painel
        # Outras rotas de transportadores
      end
    
      root to: 'home#index'
    end
    
    
  end
  

  root 'admin/dashboard#index'
end

