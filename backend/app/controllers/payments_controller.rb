class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  # POST /payments/efibank/create
  def efi_create
    amount = params[:amount].to_i
    resp = EfiBankClient.create_charge(
      amount_cents: amount,
      description: params[:description],
      callback_url: webhook_url(provider: 'efibank')
    )
    render json: JSON.parse(resp.body), status: resp.code
  rescue => e
    render json: { error: e.message }, status: 422
  end

  # POST /payments/stripe/create
  def stripe_create
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'brl',
          product_data: { name: params[:description] },
          unit_amount: params[:amount].to_i
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: success_payments_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: cancel_payments_url
    )
    render json: { checkout_url: session.url }
  rescue Stripe::StripeError => e
    render json: { error: e.message }, status: 402
  end

  # POST /payments/mercadopago/create
  def mp_create
    preference_data = {
      items: [{
        title: params[:description],
        unit_price: params[:amount].to_f / 100,
        quantity: 1
      }],
      back_urls: {
        success: success_payments_url,
        failure: cancel_payments_url
      },
      notification_url: webhook_url(provider: 'mercadopago')
    }
    preference = Mercadopago::SDK.preference.create(preference_data)
    render json: { init_point: preference['response']['init_point'] }
  rescue => e
    render json: { error: e.message }, status: 422
  end

  # POST /payments/webhook/:provider
  def webhook
    provider = params[:provider]
    payload  = request.body.read
    data = JSON.parse(payload)
    # Atualize seu modelo de pagamento/pedido conforme necessário
    head :ok
  rescue => e
    head 400
  end

  private

  def webhook_url(provider:)
    "#{request.base_url}/payments/webhook/#{provider}"
  end
end
