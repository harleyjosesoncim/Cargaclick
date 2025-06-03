class CreateFretes < ActiveRecord::Migration[7.1]
  def change
    create_table :fretes do |t|
      t.string :origem
      t.string :destino
      t.float :distancia
      t.decimal :preco, precision: 10, scale: 2
      t.timestamps
    end
  end
end
