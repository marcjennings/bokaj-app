class PaymentsController < ApplicationController

  def create
    # Create the charge on the Stripe's servers - this will charge the user's card
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
  
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.fee * 100).to_i,
        :currency => "GBP",
        :source => token,
        :description => params[:stripeEmail]
      )

      if charge.paid
        Order.create(
          :user => @user,
          :product => @product,
          :total => @product.fee
          )
      end

      redirect_to payments_order_done_path
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error] = "Unfortunatley, there was an error processing your payment: #{err[:message]}"

      redirect_to product_path(@product), notice: err
    end

    
  end

  
  def order_done
  end  
end