class Pagamento < ApplicationRecord
  belongs_to :user

  validates :tipo, :status, :valor, :link, :gateway_id, presence: true
end
