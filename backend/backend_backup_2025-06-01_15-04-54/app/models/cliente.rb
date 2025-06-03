class Cliente < ApplicationRecord
  has_many :fretes
  validates :nome, :cpf, :rg, :cep, presence: true
end
