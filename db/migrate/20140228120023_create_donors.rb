class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.decimal :amount
      t.string :email
      t.string :name
      t.string :title
      t.string :profile

      t.timestamps
    end
  end
end
