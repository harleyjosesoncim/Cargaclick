require 'mercadopago'

# Instância global do SDK do Mercado Pago
MERCADO_PAGO_SDK = Mercadopago::SDK.new(ENV['MP_ACCESS_TOKEN'])
