class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, through: :cart_items # allows for direct reference Cart.products

  def add_item(product_id, selected_size)
    if selected_size.present?
      citem = cart_items.where('product_id= ? AND selected_size= ?', product_id, selected_size).first
    else
      citem = cart_items.where('product_id= ?', product_id).first
    end

    if citem
      # increase quantity of product in cart
      new_qty = citem.quantity + 1
      citem.update_attributes(:quantity => new_qty)
    else
      # product does not exist, so make one.
      product = Product.find_by id: product_id
      citem = CartItem.create!(quantity: 1, selected_size: selected_size, product: product, cart: self)
      cart_items << citem
    end
    save
  end

  def delete_item(product_id, selected_size)
    if selected_size.present?
      citem = cart_items.where('product_id= ? AND selected_size= ?', product_id, selected_size).first
    else
      citem = cart_items.where(product_id: product_id).first
    end
    cart_items.delete(citem)
    citem.destroy
    save
  end

  def update_item(product_id, selected_size, quantity)
    if selected_size.present?
      citem = cart_items.where('product_id= ? AND selected_size= ?', product_id, selected_size).first
    else
      citem = cart_items.where(product_id: product_id).first
    end
    if quantity.to_i == 0
      # delete instead
      delete_item(product_id, selected_size)
    else
      citem.update_attributes(:quantity => quantity)
    end
    save
  end

  def total_price
    total = 0
    cart_items.each do |citem|
      total += citem.product.price.to_f * citem.quantity
    end 
    total
  end
end
