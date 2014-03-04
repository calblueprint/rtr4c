class Product < ActiveRecord::Base
<<<<<<< HEAD
	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
=======
  has_attached_file :photo
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
>>>>>>> c6aa221a80cef594c18c9f85464a180bc2f440f6
end
