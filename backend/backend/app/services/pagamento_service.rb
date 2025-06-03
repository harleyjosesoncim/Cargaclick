class PagamentoService
  def self.gerar_pagamento(valor_centavos:, descricao:, txid:)
    case ENV['GATEWAY_PAGAMENTO']
    when 'efi'
      Efi::PixChargeService.gerar_pix(valor_centavos: valor_centavos, descricao: descricao, txid: txid)
    when 'mercadopago'
      MercadoPagoService.gerar_pagamento(valor_centavos: valor_centavos, descricao: descricao)
    else
      raise "Gateway de pagamento não configurado corretamente"
    end
  end
end
