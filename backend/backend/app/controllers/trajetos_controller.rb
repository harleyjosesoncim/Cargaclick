class TrajetosController < ApplicationController
  def simular
    @origem = params[:origem] || "-23.5015,-47.4586" # Sorocaba (exemplo)
    @destino = params[:destino] || "-23.5505,-46.6333" # São Paulo (exemplo)
  end
end
