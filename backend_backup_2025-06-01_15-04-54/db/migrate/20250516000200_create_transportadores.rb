class CreateTransportadores < ActiveRecord::Migration[7.1]
  def change
    create_table :transportadores do |t|
      t.string :nome
      t.string :cpf
      t.string :cnh
      t.string :cep
      t.string :tipo_veiculo
      t.float :capacidade_kg
      t.string :pix
      t.float :valor_km, default: 20.0

      t.timestamps
    end
  end
end
