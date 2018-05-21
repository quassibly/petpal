class User < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :bookings

  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => Devise::email_regexp
end
