class Cliente < ApplicationRecord
  def nivel_fidelidade
    case pontos
    when 0..49 then 'Iniciante'
    when 50..149 then 'Frequente'
    when 150..299 then 'VIP'
    else 'Master'
    end
  end
end
