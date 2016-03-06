class ChargesController < ApplicationController
  def new
  end

  def create
  	# Amount in cents
  	@amount = 150000
  	customer = Stripe::Customer.create(
  		:email => params[:stripeEmail],
  		:source => params[:stripeToken]
  		)
  	charge = Stripe::Charge.create(
  		:customer => customer.id,
  		:amount => @amount,
  		:description => 'Rails Stripe customer rent',
  		:currency => 'usd'
  		)

  rescue Stripe::CardError => e
  	flash[ :error] = e.message
  	redirect_to new_charge_path
  end

  def show
  history = Stripe::BalanceTransaction.all(:limit => 6)
  end

end