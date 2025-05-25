class AddAssinaturaInfoToTransportadors < ActiveRecord::Migration[7.1]
  def change
    add_column :transportadors, :data_entrada, :date, default: -> { 'CURRENT_DATE' }
    add_column :transportadors, :assinatura_ativa, :boolean, default: false
  end
end
