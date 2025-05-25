class Admin::TransportadorsController < ApplicationController
  before_action :set_transportador, only: %i[show edit update destroy]
  class Admin::TransportadorsController < ApplicationController
    def index
      @transportadors = Transportador.all
    end
  
    # outros métodos como new, create, edit etc. aqui...
  end
  

  def index
    @transportadors = Transportador.all
  end

  def show
  end

  def new
    @transportador = Transportador.new
  end

  def edit
  end

  def create
    @transportador = Transportador.new(transportador_params)
    if @transportador.save
      redirect_to admin_transportadors_path, notice: 'Transportador cadastrado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @transportador.update(transportador_params)
      redirect_to admin_transportadors_path, notice: 'Dados atualizados com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @transportador.destroy
    redirect_to admin_transportadors_path, notice: 'Transportador excluído.'
  end

  private

  def set_transportador
    @transportador = Transportador.find(params[:id])
  end

  def transportador_params
    params.require(:transportador).permit(
      :nome, :cpf, :endereco, :cep, :numero_habilitacao,
      :tipo_veiculo, :capacidade_kg, :tipo_cobranca, :valor_cobranca
    )
  end
end
