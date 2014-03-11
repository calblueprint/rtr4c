class RemovePhotoFileNameFromImage < ActiveRecord::Migration
  def change
    remove_column :images, :photo_file_name
  end
end
