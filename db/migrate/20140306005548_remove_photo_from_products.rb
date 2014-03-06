class RemovePhotoFromProducts < ActiveRecord::Migration
  def up
  	remove_attachment :products, :photo
  end

  def down
  	add_attachment :products, :photo
  end
end
