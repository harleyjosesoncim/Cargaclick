class Usuario < ApplicationRecord
  # Devise para autenticação web
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_one :assinatura

  def admin?
    self.email == "admin@cargolink.com"
  end
end
