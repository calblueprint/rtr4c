class RemovePhotoFromProducts < ActiveRecord::Migration
  def change
  	remove_attachment :products, :photo
  end
end
