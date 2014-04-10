class AddColumnsToCartItems < ActiveRecord::Migration
  def change
  	add_column :cart_items, :cart_id, :integer
  end
end
