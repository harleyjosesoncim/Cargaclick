class Frete < ApplicationRecord
  belongs_to :cliente
  belongs_to :transportador, optional: true

  validates :origem_cep, :destino_cep, :peso_kg, :descricao, presence: true
  enum status: { pendente: 0, aceito: 1, finalizado: 2 }
end


  def calcular_valor(distancia_km)
    self.valor_total = distancia_km * (transportador&.valor_km || 20.0)
    self.comissao = (valor_total * Rails.application.config.x.comissao_padrao).round(2)
  end
