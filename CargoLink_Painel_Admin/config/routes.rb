Rails.application.routes.draw do
  devise_for :usuarios
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: redirect('/admin')
end
