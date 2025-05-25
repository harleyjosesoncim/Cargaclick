has_many :pontuacoes
def total_pontos
  pontuacoes.sum(:valor)
end