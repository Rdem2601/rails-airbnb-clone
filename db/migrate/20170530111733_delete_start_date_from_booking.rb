class DeleteStartDateFromBooking < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :start_date
    remove_column :bookings, :end_date
    add_column :bookings, :number_of_days, :integer
  end
end
