class Donation < ActiveRecord::Base
  belongs_to :donor
  validates_presence_of :amount, :message
  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
end
