class CartController < ApplicationController

  def index
    @cart = current_cart
  end

  def add_to_cart
    current_cart.add_item(params[:product_id])
    redirect_to action: "index"
  end

  def delete_from_cart
    current_cart.delete_item(params[:product_id])
    redirect_to action: "index"
  end

  def update_cart
    current_cart.update_item(params[:product_id], params[:new_quantity])
    redirect_to action: "index"
  end
end
