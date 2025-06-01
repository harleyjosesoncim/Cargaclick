class ClientesController < ApplicationController
  def create
    cliente = Cliente.new(cliente_params)
    if cliente.save
      render json: cliente, status: :created
    else
      render json: cliente.errors, status: :unprocessable_entity
    end
  end

  private
  def cliente_params
    params.require(:cliente).permit(:nome, :cpf, :rg, :cep)
  end
end
