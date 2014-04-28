class AddProductToSizeVariant < ActiveRecord::Migration
  def change
    add_column :size_variants, :product_id, :integer
  end
end
