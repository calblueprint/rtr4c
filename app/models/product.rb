class Product < ActiveRecord::Base
  has_many :photos, as: :imageable
  accepts_nested_attributes_for :photos

end
