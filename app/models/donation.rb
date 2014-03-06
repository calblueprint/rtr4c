class Donation < ActiveRecord::Base
  belongs_to :donor
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :amount
end
