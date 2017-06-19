class CreateCarsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :make,                null: false
      t.string :model,               null: false
      t.string :vin,                 null: false
      t.string :year,                null: false
      t.string :color,               null: false
      t.string :license_plate,       null: false
      t.integer :mileage,            null: false
      t.integer :type_id,            null: false, :references => [:types, :id]
    end

    add_index :cars, :type_id
  end
end
