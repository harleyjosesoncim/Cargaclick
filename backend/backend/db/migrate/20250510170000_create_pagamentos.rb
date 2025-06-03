class CreatePagamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :pagamentos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :tipo
      t.string :status
      t.decimal :valor, precision: 10, scale: 2
      t.string :link
      t.string :gateway_id

      t.timestamps
    end
  end
end
