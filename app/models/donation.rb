class Donation < ActiveRecord::Base
  belongs_to :donor
  validates_presence_of :amount, :message
end
