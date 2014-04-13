class Project < ActiveRecord::Base
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, allow_destroy: true
end
