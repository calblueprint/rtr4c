class Purchase < ActiveRecord::Base
  has_many :cart_items
end
