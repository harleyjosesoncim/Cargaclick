
Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :usuarios
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :clientes
  resources :transportadors
end
