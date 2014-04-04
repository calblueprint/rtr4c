class PressUpdate < ActiveRecord::Base
	validates :title, presence: true
	validates :link, presence: true
end
