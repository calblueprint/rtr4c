class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, through: :cart_items # allows for direct reference Cart.products

  def add_item(product_id)
    citem = cart_items.where('product_id= ?', product_id).first
    if citem
      # increase quantity of product in cart
      new_qty = citem.quantity + 1
      citem.update_attributes(:quantity => new_qty)
    else
      # product does not exist, so make one.
      product = Product.find_by id: product_id
      citem = CartItem.create!(quantity: 1, product: product, cart: self)
      cart_items << citem
    end
    save
  end

  def delete_item(product_id)
    citem = cart_items.where('product_id= ?', product_id).first
    cart_items.delete(citem)
    save
  end

  def update_item(product_id, quantity)
    citem = cart_items.where('product_id= ?', product_id).first
    citem.update_attributes(:quantity => quantity)
    save
  end

  def total_price
    cart_items.to_a.sum(&:price)
  end
end
