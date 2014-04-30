class Product < ActiveRecord::Base
  has_many :images, as: :imageable
  has_many :size_variants
  accepts_nested_attributes_for :images, allow_destroy: true
end
