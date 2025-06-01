class SessoesController < ApplicationController
  def nova; end

  def criar
    usuario = Usuario.find_by(email: params[:email])
    if usuario&.authenticate(params[:senha])
      session[:usuario_id] = usuario.id
      redirect_to admin_dashboard_path
    else
      flash.now[:alert] = 'Email ou senha inválidos'
      render :nova
    end
  end

  def destruir
    session[:usuario_id] = nil
    redirect_to login_path, notice: 'Sessão encerrada com sucesso.'
  end
end
