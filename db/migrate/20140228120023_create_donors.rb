class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :amount
      t.string :email
      t.string :name
      t.string :title
      t.text :message
      t.string :profile

      t.timestamps
    end
  end
end
