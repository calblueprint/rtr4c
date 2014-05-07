class Project < ActiveRecord::Base
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images,    allow_destroy: true

  has_many :designers
  accepts_nested_attributes_for :designers, allow_destroy: true
end
