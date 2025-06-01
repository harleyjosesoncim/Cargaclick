class FretesController < ApplicationController
  def create
    origem_coords = GeolocationService.cep_to_coordinates(frete_params[:origem_cep])
    destino_coords = GeolocationService.cep_to_coordinates(frete_params[:destino_cep])
    distancia = RouteService.get_distance_km(origem_coords, destino_coords)

    return render json: { error: 'Não foi possível calcular a distância.' }, status: :unprocessable_entity unless distancia

        frete = Frete.new(frete_params)
    # Exemplo de cálculo fictício de 10km para testar monetização
        frete.calcular_valor(distancia)

    if frete.save
      render json: frete, status: :created
    else
      render json: frete.errors, status: :unprocessable_entity
    end
  end

  private
  def frete_params
    params.require(:frete).permit(:cliente_id, :origem_cep, :destino_cep, :peso_kg, :descricao)
  end
end
