class TransportadoresController < ApplicationController
  def create
    transportador = Transportador.new(transportador_params)
    if transportador.save
      render json: transportador, status: :created
    else
      render json: transportador.errors, status: :unprocessable_entity
    end
  end

  private
  def transportador_params
    params.require(:transportador).permit(:nome, :cpf, :cnh, :cep, :tipo_veiculo, :capacidade_kg, :pix, :valor_km)
  end
end
