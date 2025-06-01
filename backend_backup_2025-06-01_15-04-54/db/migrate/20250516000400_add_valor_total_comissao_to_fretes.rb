class AddValorTotalComissaoToFretes < ActiveRecord::Migration[7.1]
  def change
    add_column :fretes, :valor_total, :float
    add_column :fretes, :comissao, :float
  end
end
