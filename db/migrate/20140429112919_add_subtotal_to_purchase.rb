class AddSubtotalToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :subtotal, :decimal
  end
end
