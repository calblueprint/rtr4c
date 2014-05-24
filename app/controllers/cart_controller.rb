class CartController < ApplicationController

  before_action :authorize

  def index
    @cart = current_cart
  end

  def add_to_cart
    current_cart.add_item(params[:product_id], params[:selected_size])
    redirect_to action: "index"
  end

  def delete_from_cart
    current_cart.delete_item(params[:product_id], params[:selected_size])
    redirect_to action: "index"
  end

  def update_cart
    current_cart.update_item(params[:cart_item][:product_id], params[:cart_item][:selected_size], params[:cart_item][:quantity])
    redirect_to action: "index"
  end
end
