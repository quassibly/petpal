class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets, dependent: :destroy
  has_many :bookings

  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => Devise::email_regexp
end
