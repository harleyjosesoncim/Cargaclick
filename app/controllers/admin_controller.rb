class AdminController < ApplicationController
  before_action :autenticar_admin!

  def dashboard
    @transportadores = Transportador.all
    @clientes = Cliente.all
    @fretes = Frete.all
  end

  private

  def autenticar_admin!
    usuario = Usuario.find_by(id: session[:usuario_id])
    unless usuario&.admin?
      redirect_to login_path, alert: 'Acesso restrito ao administrador.'
    end
  end
end
