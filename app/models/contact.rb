class Contact < ActiveRecord::Base
  validates :email, :fname, :lname, :phone, :message, presence: true
end
