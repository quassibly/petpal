class Pet < ApplicationRecord
  belongs_to :user
  has_many :users, through: :booking
  has_many :bookings

  validates :name, presence: true
  validates :animal_type, presence: true
  validates :user_id, presence: true

  mount_uploader :photo, PhotoUploader
end

