class Photo < ActiveRecord::Base
  # attr_accessible :gallery_id, :name, :image <-- used as reference for now
	belongs_to :gallery
  mount_uploader :image, ImageUploader
end
