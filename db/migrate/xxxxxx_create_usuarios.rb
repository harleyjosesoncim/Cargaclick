class CreateUsuarios < ActiveRecord::Migration[7.1]
  def change
    create_table :usuarios do |t|
      t.string :email, null: false
      t.string :senha_digest
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
