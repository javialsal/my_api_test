class AddListIdToModels < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :listing, foreign_key: true
    add_reference :reservations, :listing, foreign_key: true
    add_reference :missions, :listing, foreign_key: true
  end
end
