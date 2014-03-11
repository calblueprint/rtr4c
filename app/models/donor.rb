class Donor < ActiveRecord::Base
  has_many :donations
  validates_presence_of :name
  validates_presence_of :email, uniqueness: true
  validates_presence_of :amount

  accepts_nested_attributes_for :donations, allow_destroy: true
end
