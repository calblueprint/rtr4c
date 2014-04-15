class AddPurchaseToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :purchase_id, :integer
  end
end
