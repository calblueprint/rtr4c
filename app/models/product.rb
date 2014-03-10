class Product < ActiveRecord::Base
  has_many :imageable
  
  # validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
