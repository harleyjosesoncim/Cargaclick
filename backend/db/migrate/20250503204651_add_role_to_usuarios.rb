class AddRoleToUsuarios < ActiveRecord::Migration[7.1]
  def change
    add_column :usuarios, :role, :string
  end
end
