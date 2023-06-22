class ChangeValueOfDates < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :start_date, :date
    change_column :bookings, :end_date, :date
    change_column :reservations, :start_date, :date
    change_column :reservations, :end_date, :date
    change_column :missions, :date, :date
  end
end
