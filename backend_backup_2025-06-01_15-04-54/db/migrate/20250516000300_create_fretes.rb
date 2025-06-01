class CreateFretes < ActiveRecord::Migration[7.1]
  def change
    create_table :fretes do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :transportador, foreign_key: true
      t.string :origem_cep
      t.string :destino_cep
      t.float :peso_kg
      t.text :descricao
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
