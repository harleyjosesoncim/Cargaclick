class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      ## Devise campos obrigatórios
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Campos adicionais do Devise
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      ## Campos extras (opcional)
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
