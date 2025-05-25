module Admin
  class ClientesController < ApplicationController
    def new
      @cliente = Cliente.new
    end

    def create
      @cliente = Cliente.new(cliente_params)
      if @cliente.save
        redirect_to admin_clientes_path, notice: "Cliente criado com sucesso."
      else
        render :new
      end
    end

    def index
      @clientes = Cliente.all
    end

    private

    def cliente_params
      params.require(:cliente).permit(:nome, :cpf, :cep_destino, :tipo_carga, :descricao, :descarregar_em)
    end
    def simular_trajeto
      @cliente = Cliente.find(params[:id])
      # Lógica para simular o trajeto com base nos dados do cliente
      # Por exemplo, calcular a distância até o destino desejado
      # e verificar os transportadores disponíveis conforme as regras de distância
    end
    
  end
end
