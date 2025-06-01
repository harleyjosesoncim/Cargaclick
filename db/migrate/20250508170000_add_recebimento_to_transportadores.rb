class AddRecebimentoToTransportadores < ActiveRecord::Migration[7.0]
  def change
    add_column :transportadors, :forma_recebimento, :string
    add_column :transportadors, :chave_pix, :string
    add_column :transportadors, :banco, :string
    add_column :transportadors, :agencia, :string
    add_column :transportadors, :conta, :string
    add_column :transportadors, :tipo_conta, :string
  end
end
