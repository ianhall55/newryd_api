class CreateCarRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :car_rentals do |t|
      t.integer   :user_id,              null: false, :references => [:users, :id]
      t.integer   :car_id,               null: false, :references => [:cars, :id]
      t.string    :status,               null: false
      t.integer   :type_id,              null: false, :references => [:types, :id]
      t.integer   :price_tier_id,        null: false, :references => [:price_tiers, :id]
      t.datetime  :rental_start_date,    null: false
    end

    add_index :car_rentals, :user_id
    add_index :car_rentals, :car_id
  end
end
