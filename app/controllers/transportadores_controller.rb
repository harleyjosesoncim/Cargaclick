
def filtros
  # Renderiza a página com o formulário
end

def buscar
  @transportadores = Transportador.all

  @transportadores = @transportadores.where(tipo_veiculo: params[:tipo_veiculo]) if params[:tipo_veiculo].present?
  @transportadores = @transportadores.where("preco_km <= ?", params[:preco_max]) if params[:preco_max].present?
  @transportadores = @transportadores.joins(:avaliacoes).group("transportadores.id").having("AVG(avaliacoes.nota) >= ?", params[:avaliacao_minima].to_f) if params[:avaliacao_minima].present?

  respond_to do |format|
    format.html { render :resultado_filtros }
  end
end
