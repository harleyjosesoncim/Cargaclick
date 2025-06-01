class AdicionarRgDataNascimentoAoTransportador < ActiveRecord::Migration[7.0]
  def change
    add_column :transportadors, :rg, :string
    add_column :transportadors, :data_nascimento, :date
  end
end
