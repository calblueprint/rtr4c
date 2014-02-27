class FixupAddPhotoToProducts < ActiveRecord::Migration
  def change
    revert AddPhotoToProducts
  end
end
