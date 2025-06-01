class PagamentosController < ApplicationController
  def criar_pagamento
    descricao = "Frete CargoLink"
    valor_centavos = 5000  # Exemplo: R$50,00
    vencimento = Date.today + 3.days

    begin
      resultado = MercadoPagoService.create_pix_payment(descricao, valor_centavos)
      tipo = "mercado_pago"
      link = resultado.dig("point_of_interaction", "transaction_data", "qr_code_base64") || "Pix gerado"
      gateway_id = resultado["id"]
      status = resultado["status"]
    rescue => e
      Rails.logger.warn("Erro MercadoPago: #{e.message}, tentando EfiBank...")

      cliente = {
        name: "Cliente CargoLink",
        email: "cliente@example.com",
        cpf: "12345678909",
        phone_number: "11999999999"
      }

      begin
        resultado = EfibankService.generate_boleto(cliente, valor_centavos, vencimento)
        tipo = "efibank"
        link = resultado.dig("data", "pdf") || "Boleto gerado"
        gateway_id = resultado.dig("data", "charge_id").to_s
        status = "pendente"
      rescue => ex
        Rails.logger.error("Erro ao gerar com EfiBank: #{ex.message}")
        render json: { erro: "Falha ao gerar pagamento com ambos os serviços" }, status: :unprocessable_entity and return
      end
    end

    pagamento = Pagamento.create!(
      user_id: current_user.id,
      tipo: tipo,
      status: status,
      valor: valor_centavos / 100.0,
      link: link,
      gateway_id: gateway_id
    )

    render json: { mensagem: "Pagamento criado com sucesso", link: pagamento.link, tipo: pagamento.tipo }
  end
end
