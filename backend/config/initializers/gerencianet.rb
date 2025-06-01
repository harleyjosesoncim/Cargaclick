# config/initializers/gerencianet.rb

require 'rest-client'
require 'json'

# Exemplo de chamada à API Gerencianet para gerar cobrança Pix
# ENV['GN_CLIENT_ID'] e ENV['GN_CLIENT_SECRET'] devem estar definidos

def gerencianet_auth_token
  url = 'https://api.gerencianet.com.br/v1/authorize'
  payload = {
    client_id: ENV['GN_CLIENT_ID'],
    client_secret: ENV['GN_CLIENT_SECRET']
  }

  response = RestClient.post(url, payload.to_json, { content_type: :json, accept: :json })
  JSON.parse(response.body)['access_token']
end
