class Donor < ActiveRecord::Base
  has_many :donations
  validates_presence_of :name, :amount
  validates_presence_of :email, uniqueness: true
end
