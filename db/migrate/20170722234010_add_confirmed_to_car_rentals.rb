class AddConfirmedToCarRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :car_rentals, :confirmed, :boolean, default: false, null: false
  end
end
