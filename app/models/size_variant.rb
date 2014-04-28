class SizeVariant < ActiveRecord::Base
  belongs_to :product
  serialize :sizes, Array
end
