class BraintreeController < ApplicationController
  def new
    @reservation = Reservation.find(params[:reservation_id])
    @client_token = Braintree::ClientToken.generate
  end

  def checkout
    reservation_id = params[:reservation_id]
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
    reservation = Reservation.find(reservation_id)
    # listing = amount.listing.id
    
    result = Braintree::Transaction.sale(
      :amount => reservation.total_price,
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
      )
      if result.success?
      redirect_to listing_path(reservation.listing.id), :flash => { :success => "You've successfully booked #{reservation.listing.name}" }
    else
      redirect_to listing_path(reservation.listing.id), :flash => { :error => "Transaction failed. Please try again." }
    end
  end

end
