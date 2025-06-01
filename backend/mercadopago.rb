require 'mercadopago'

sdk = Mercadopago::SDK.new(ENV['MP_ACCESS_TOKEN'])

# Exemplo de uso:
# payment_data = {
#   transaction_amount: 100,
#   description: 'Descricao do produto',
#   payment_method_id: 'pix',
#   payer: { email: 'comprador@example.com' }
# }
# response = sdk.payment.create(payment_data)