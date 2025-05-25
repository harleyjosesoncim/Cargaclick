require 'faraday'
require 'json'

class PagamentosController < ApplicationController
  def gerar_pix
    conn = Faraday.new(url: 'https://pix.api.efipay.com.br')
    auth = Faraday.new(url: 'https://pix.api.efipay.com.br')

    response = auth.post('/v1/authorize', {
      grant_type: 'client_credentials',
      client_id: ENV['EFI_CLIENT_ID'],
      client_secret: ENV['EFI_CLIENT_SECRET']
    })

    token = JSON.parse(response.body)['access_token']

    payload = {
      calendario: { expiracao: 3600 },
      devedor: { cpf: '12345678909', nome: 'Transportador CargoLink' },
      valor: { original: '19.90' },
      chave: ENV['EFI_PIX_KEY'],
      solicitacaoPagador: 'Assinatura mensal CargoLink'
    }

    headers = {
      'Authorization': "Bearer #{token}",
      'Content-Type': 'application/json'
    }

    pix_response = conn.post('/v2/cob', payload.to_json, headers)
    resposta = JSON.parse(pix_response.body)

    @qrcode = resposta['loc']['id']
    @copiacola = resposta['pixCopiaECola'] || 'Código indisponível'
    render 'pagamentos/gerar_pix'
  end

  def mercado_pago
    render plain: "Em breve: integração com Mercado Pago."
  end
end
