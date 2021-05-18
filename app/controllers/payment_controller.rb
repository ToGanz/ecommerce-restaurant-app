class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def create
    @order = current_order
    @order.set_total
    @order.save
    
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          unit_amount: (@order.total * 100).to_i,
          currency: 'eur',
          product_data: {
            name: 'Food'
          },
        },
        quantity: 1,
      }],
      metadata: {
        order: @order.id
      },
      mode: 'payment',
      success_url: payment_success_url,
      cancel_url: payment_cancel_url,
    })

    respond_to do |format|
      format.js
    end
  end

  def success
    if current_order.paid
      session[:order_id] = nil
    end
  end

  def cancel

  end

  def webhook
    event = nil
    # Verify webhook signature and extract the event
    # See https://stripe.com/docs/webhooks/signatures for more information.
    begin
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      payload = request.body.read
      endpoint_secret =  Rails.application.credentials.stripe[:endpoint_secret]
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue JSON::ParserError => e
      # Invalid payload
      return nothing: true, status: :bad_request
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      return nothing: true, status: :bad_request
    end

    if event['type'] == 'checkout.session.completed'
      checkout_session = event['data']['object']
      order_id = checkout_session[:metadata][:order]
      order = Order.find(order_id)
      order.update(paid: true)
    end
  end

end
