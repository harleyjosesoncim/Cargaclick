class Frete < ApplicationRecord
  belongs_to :cliente
  belongs_to :transportador

  after_update :acumular_pontos_se_pago

  private

  def acumular_pontos_se_pago
    if saved_change_to_status_pagamento? && status_pagamento == 'pago'
      transportador.increment!(:pontos, 10)
      cliente.increment!(:pontos, 5)
    end
  end
end
