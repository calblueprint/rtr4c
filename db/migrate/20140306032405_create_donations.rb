class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.belongs_to :donor
      t.decimal :amount
      t.text :message
      t.timestamps
    end
  end
end
