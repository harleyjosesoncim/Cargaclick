class AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_cliente, only: [:edit_cliente, :update_cliente, :destroy_cliente]
  before_action :set_transportador, only: [:edit_transportador, :update_transportador, :destroy_transportador]

  def index
    @clientes = Cliente.all
    @transportadores = Transportador.all
    render json: { clientes: @clientes, transportadores: @transportadores }
  end

  def edit_cliente; end
  def update_cliente
    if @cliente.update(cliente_params)
      render json: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  def destroy_cliente
    @cliente.destroy
    head :no_content
  end

  def edit_transportador; end
  def update_transportador
    if @transportador.update(transportador_params)
      render json: @transportador
    else
      render json: @transportador.errors, status: :unprocessable_entity
    end
  end

  def destroy_transportador
    @transportador.destroy
    head :no_content
  end

  private

  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  def set_transportador
    @transportador = Transportador.find(params[:id])
  end

  def cliente_params
    params.require(:cliente).permit(:nome, :cpf, :rg, :cep)
  end

  def transportador_params
    params.require(:transportador).permit(:nome, :cpf, :cnh, :cep, :tipo_veiculo, :capacidade_kg, :pix, :valor_km)
  end
end


  def authenticate_admin!
    unless session[:admin_id] && Admin.find_by(id: session[:admin_id])
      render json: { error: 'Acesso não autorizado.' }, status: :unauthorized
    end
  end
