json.extract! solicitante, :id, :nome, :email, :telefone, :endereco, :created_at, :updated_at
json.url solicitante_url(solicitante, format: :json)
