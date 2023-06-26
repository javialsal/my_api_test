class Listing < ApplicationRecord
  has_many :bookings
  has_many :reservations
  has_many :missions

  validates :num_rooms, presence: true, comparison: { greater_than: 0 }
end
