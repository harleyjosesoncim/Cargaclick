class Transportador < ApplicationRecord
  has_many :fretes
  validates :nome, :cpf, :cnh, :cep, :tipo_veiculo, :capacidade_kg, :pix, presence: true
end
