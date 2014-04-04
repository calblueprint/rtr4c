class Blogpost < ActiveRecord::Base
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :title, presence: true
  validates :post, presence: true
end
