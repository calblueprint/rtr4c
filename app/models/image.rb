class Image < ActiveRecord::Base
	belongs_to :project
	has_attached_file :photo
	
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
