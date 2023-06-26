class Mission < ApplicationRecord
  belongs_to :listing

  enum mission_type: { first_checkin: 0, last_checkout: 1, checkout_checkin: 3 }

  after_create :set_price

  def set_price
    num_rooms = listing.num_rooms
    mission_type == "last_checkout" ? update(price: num_rooms * 5) : update(price: num_rooms * 10)
  end

  def self.no_lc_on_same_date(listing, date)
    existing_missions = Mission.where(listing_id: listing.id, mission_type: 'last_checkout', date: date)
    existing_missions.count.zero?
  end
end
