class CreateFretes < ActiveRecord::Migration[7.1]
  def change
    create_table :fretes do |t|
      t.string :origem
      t.string :destino
      t.decimal :preco
      t.references :cliente, foreign_key: true
      t.timestamps
    end
  end
end
