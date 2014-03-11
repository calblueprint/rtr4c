class FixDonorId < ActiveRecord::Migration
  def change
  	rename_column :donations, :donors_id, :donor_id
  end
end
