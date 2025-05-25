class ClientesController < ApplicationController
  def cartao
  end

  def salvar_cartao
    cliente = Cliente.find_by(email: params[:email])
    if cliente
      cliente.update(
        token_cartao: params[:token],
        metodo_pagamento: params[:paymentMethodId],
        banco_emissor: params[:issuerId],
        doc_numero: params[:docNumber],
        doc_tipo: params[:docType]
      )
      render json: { status: 'Cartão salvo com sucesso' }, status: :ok
    else
      render json: { error: 'Cliente não encontrado' }, status: :not_found
    end
  end
end
