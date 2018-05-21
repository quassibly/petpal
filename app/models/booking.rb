class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :pet_id, presence: true
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
end
