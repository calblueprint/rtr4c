class AddGalleryIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :gallery_id, :integer
  end
end
