class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :rg
      t.string :cep

      t.timestamps
    end
  end
end
