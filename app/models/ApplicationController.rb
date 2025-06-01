class ClientesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :verificar_cliente

  def dashboard
    # Ações exclusivas para clientes
  end

  private

  def verificar_cliente
    redirect_to root_path, alert: "Acesso negado." unless current_usuario&.cliente?
  end
end
