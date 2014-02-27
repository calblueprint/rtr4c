class Product < ActiveRecord::Base
  has_one :image, :as => :imageable
end
