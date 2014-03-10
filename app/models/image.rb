class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file :photo
end
