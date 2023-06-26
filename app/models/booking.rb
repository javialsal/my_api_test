class Booking < ApplicationRecord
  belongs_to :listing

  after_create :request_cleanings
  before_destroy :destroy_missions

  def request_cleanings


      Mission.create(listing: listing, date: start_date, mission_type: "first_checkin")
      Mission.create(listing: listing, date: end_date, mission_type: "last_checkout")
  end

  private

  def destroy_missions
      listing.missions.where('date >= ? AND date <= ?', start_date, end_date).delete_all
  end
end
