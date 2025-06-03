class CreateSolicitantes < ActiveRecord::Migration[7.1]
  def change
    create_table :solicitantes do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :endereco

      t.timestamps
    end
  end
end
