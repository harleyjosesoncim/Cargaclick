class Assinatura < ApplicationRecord
  belongs_to :usuario

  enum status: { pendente: 0, ativa: 1, expirada: 2 }

  validates :data_validade, presence: true
end
