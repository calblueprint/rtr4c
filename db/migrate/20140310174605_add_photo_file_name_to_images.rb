class AddPhotoFileNameToImages < ActiveRecord::Migration
  def change
    add_column :images, :photo_file_name, :string
  end
end
