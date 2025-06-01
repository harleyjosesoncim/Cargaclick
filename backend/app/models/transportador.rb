
has_many :avaliacoes
def media_avaliacoes
  avaliacoes.average(:nota).to_f.round(1)
end
