class CreateClientes < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :cep_destino
      t.string :tipo_carga
      t.text :descricao
      t.string :descarregar_em

      t.timestamps
    end
  end
end
