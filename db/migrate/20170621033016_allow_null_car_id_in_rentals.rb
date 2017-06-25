class AllowNullCarIdInRentals < ActiveRecord::Migration[5.0]
  def change
    change_column :car_rentals, :car_id, :integer, :null => true
  end
end
