require 'gerencianet'

module Efi
  class PixChargeService
    def self.gerar_pix(valor_centavos:, descricao:, txid:)
      body = {
        calendario: { expiracao: 3600 },
        devedor: {
          cpf: '12345678909',
          nome: 'Cliente Exemplo'
        },
        valor: {
          original: "%.2f" % (valor_centavos / 100.0)
        },
        chave: ENV['EFI_PIX_KEY'],
        solicitacaoPagador: descricao
      }

      gerencianet = Gerencianet.new(GnConfig)
      gerencianet.pix_create_immediate_charge({ txid: txid }, body)
    end
  end
end
