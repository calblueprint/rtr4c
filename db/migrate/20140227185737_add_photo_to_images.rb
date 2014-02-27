class AddPhotoToImages < ActiveRecord::Migration
  def self.up
    add_attachment :images, :photo
  end

  def self.down
    remove_attachment :images, :photo
  end
end
