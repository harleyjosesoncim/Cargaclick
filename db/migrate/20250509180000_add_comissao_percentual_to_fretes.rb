class AddComissaoPercentualToFretes < ActiveRecord::Migration[7.0]
  def change
    add_column :fretes, :comissao_percentual, :decimal, default: 10.0
  end
end
