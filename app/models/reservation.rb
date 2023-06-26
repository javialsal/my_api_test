class Reservation < ApplicationRecord
  belongs_to :listing

  after_create :request_cleanings
  before_destroy :destroy_missions

  def request_cleanings
    # See comment in models/mission.rb
    # Mission.generate_cleanings(self)
    Mission.create(listing: listing, date: end_date, mission_type: "checkout_checkin") if Mission.no_lc_on_same_date(listing, end_date)
  end

  private

  def destroy_missions
    listing.missions.where('date >= ? AND date <= ?', start_date, end_date).delete_all
  end
end
