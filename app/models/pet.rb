class Pet < ApplicationRecord
  belongs_to :user
  has_many :users, through: :booking
  has_many :bookings

  validates :name, presence: true
  validates :animal_type, presence: true

  validates :user_id, presence: true

  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :pet_search,
    against: [ :animal_type, :breed, :name ],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

