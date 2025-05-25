class AddAssinaturaEPontos < ActiveRecord::Migration[7.0]
  def change
    add_column :transportadors, :assinatura_ativa, :boolean, default: false
    add_column :transportadors, :plano, :string, default: 'gratuito'
    add_column :transportadors, :pontos, :integer, default: 0
    add_column :clientes, :pontos, :integer, default: 0
  end
end
