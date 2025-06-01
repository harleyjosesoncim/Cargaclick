class AddTokenCartaoToClientes < ActiveRecord::Migration[7.0]
  def change
    add_column :clientes, :token_cartao, :string
    add_column :clientes, :metodo_pagamento, :string
    add_column :clientes, :banco_emissor, :string
    add_column :clientes, :doc_tipo, :string
    add_column :clientes, :doc_numero, :string
  end
end
