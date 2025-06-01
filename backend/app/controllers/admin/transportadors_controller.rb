module Admin
  class TransportadorsController < ApplicationController
    def new
      @transportador = Transportador.new
    end

    def create
      @transportador = Transportador.new(transportador_params)
      if @transportador.save
        redirect_to admin_transportadors_path, notice: "Transportador criado com sucesso."
      else
        render :new
      end
    end

    def index
      @transportadors = Transportador.all
    end

    private

    def transportador_params
      params.require(:transportador).permit(:nome, :cpf, :tipo_veiculo, :carga, :custo_km)
    end
  end
end
