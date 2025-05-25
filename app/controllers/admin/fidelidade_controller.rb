class Admin::FidelidadeController < ApplicationController
  def index
    @top_transportadores = Transportador.order(pontos: :desc).limit(10)
    @top_clientes = Cliente.order(pontos: :desc).limit(10)
    namespace :admin do
      get 'fidelidade', to: 'fidelidade#index'
    end
    
  end
end
