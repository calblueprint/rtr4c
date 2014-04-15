class CheckoutsController < ApplicationController
  def new
  end

  def create
    name = params[:checkout][:firstname] + ", " + params[:checkout][:lastname]
    if (params[:checkout][:address2].blank?)
      address = params[:checkout][:address1] + ", " + params[:checkout][:city] + ", " + params[:checkout][:state] + " " + params[:checkout][:zip]
    else
      address = params[:checkout][:address1] + ", " + params[:checkout][:address2] + ", " + params[:checkout][:city] + ", " + params[:checkout][:state] + " " + params[:checkout][:zip]
    end
    cart = current_cart
    @purchase = Purchase.new(:name => name, :address => address, :email => params[:checkout][:email], :total => cart.total_price)
    token = params[:stripeToken]
    charge = (cart.total_price.to_f * 100).to_i
    if @purchase.save
      charge = Stripe::Charge.create(
        :amount => charge,
        :currency => "usd",
        :card => token,
        :description => "Purchase from " + params[:checkout][:email]
      )
      cart.cart_items.each do |citem|
        @purchase.cart_items << citem
      end
      cart.destroy
      cart.save
    else
      render action: 'new'
    end
  end
end
