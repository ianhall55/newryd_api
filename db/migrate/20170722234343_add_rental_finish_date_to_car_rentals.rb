class AddRentalFinishDateToCarRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :car_rentals, :rental_finish_date, :datetime
  end
end
