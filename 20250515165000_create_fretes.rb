class CreateFretes < ActiveRecord::Migration[7.1]
  def change
    create_table :fretes do |t|
      t.string :origem
      t.string :destino
      t.float :distancia_km
      t.float :valor_estimado
      t.string :tipo_veiculo
      t.references :cliente, foreign_key: true
      t.references :transportador, foreign_key: true
      t.timestamps
    end
  end
end
