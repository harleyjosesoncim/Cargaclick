class AddStatusPagamentoToFretes < ActiveRecord::Migration[7.0]
  def change
    add_column :fretes, :status_pagamento, :string, default: 'pendente'
  end
end
