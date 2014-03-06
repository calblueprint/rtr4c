class Product < ActiveRecord::Base
  has_one :gallery
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
