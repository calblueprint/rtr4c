class Project < ActiveRecord::Base
	has_many :images, :as => :imageable

	validates_presence_of :name
	validates_presence_of :date
	validates_presence_of :location
	validates_presence_of :description
end
