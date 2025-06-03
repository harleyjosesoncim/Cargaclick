require 'mercadopago'

class MercadoPagoService
  def self.create_pix_payment(description, amount_cents)
    sdk = Mercadopago::SDK.new(ENV['MP_ACCESS_TOKEN'])

    payment_data = {
      transaction_amount: amount_cents / 100.0,
      description: description,
      payment_method_id: "pix",
      payer: {
        email: "cliente@example.com"
      }
    }

    result = sdk.payment.create(payment_data)
    result[:response]
  end

  def self.create_credit_payment(description, amount_cents)
    sdk = Mercadopago::SDK.new(ENV['MP_ACCESS_TOKEN'])

    payment_data = {
      transaction_amount: amount_cents / 100.0,
      token: "CARD_TOKEN_EXEMPLO",
      installments: 1,
      payment_method_id: "visa",
      payer: {
        email: "cliente@example.com"
      },
      description: description
    }

    result = sdk.payment.create(payment_data)
    result[:response]
  end
end
