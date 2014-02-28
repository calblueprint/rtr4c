class AddPhotoToProducts < ActiveRecord::Migration
  def self.up
    add_attachment :products, :photo
  end

  def self.down
    remove_attachment :products, :photo
  end
end
