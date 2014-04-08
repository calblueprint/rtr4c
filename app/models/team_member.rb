class TeamMember < ActiveRecord::Base
  has_many :images, as: :imageable # keep has_many just for now; nested forms bugs out
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :role, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 4, message: "must be selected"}
end
