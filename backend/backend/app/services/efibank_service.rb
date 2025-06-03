# app/services/efibank_service.rb

class EfiBankService
  def initialize
    @client = EFIBANK_CLIENT
  end

  # Cria uma transação Pix
  # params esperados:
  #   :amount   (Float),
  #   :reference (String),
  #   :payer     (Hash com email ou id do cliente)
  def create_payment(params)
    @client.create_transaction(
      amount:    params[:amount],
      reference: params[:reference],
      payer:     params[:payer]
    )
  end

  # Consulta status da transação
  def find_payment(id)
    @client.get_transaction(id)
  end
end
