class CreateTransportadores < ActiveRecord::Migration[7.0]
  def change
    create_table :transportadores do |t|
      t.string :nome
      t.string :cpf
      t.string :endereco
      t.string :cep
      t.string :numero_habilitacao
      t.string :tipo_veiculo
      t.integer :capacidade_kg
      t.string :tipo_cobranca
      t.decimal :valor_cobranca, precision: 10, scale: 2

      t.timestamps
    end
  end
end
