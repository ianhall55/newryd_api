class PaymentsController < ApplicationController
  skip_before_action :authorize_request, only: :client_token

  def client_token
    @token = Braintree::ClientToken.generate
    render plain: @token
  end

  def checkout
    valid = 'fake-valid-nonce'
    invalid = 'fake-processor-declined-visa-nonce'

    nonce_from_the_client = params[:payment_method_nonce] || valid
    amount = params[:amount] || 250.0

    result = Braintree::Transaction.sale(
      :amount => amount,
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )

    if result.success?
      store(result)
      activate_user
      render json: { message: "Payment accepted!" }
    else
      render json: { message: "Payment declined" }
    end
  end

  private

  def store(result)
    puts "result stored"
  end
end
