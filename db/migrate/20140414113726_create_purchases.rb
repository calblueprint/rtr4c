class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :name
      t.text :address
      t.string :email
      t.decimal :total

      t.timestamps
    end
  end
end
