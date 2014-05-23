class ChangeDonorAndDonation < ActiveRecord::Migration
  def change
    remove_column :donors, :title
    remove_column :donors, :profile
    add_column :donors, :address, :string
  end
end
