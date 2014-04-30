class AddSelectedSizeToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :selected_size, :string
  end
end
