class CreateCarHistoryTable < ActiveRecord::Migration[5.0]
  def change
    create_table :car_history do |t|
      t.integer :user_id,                null: false, :references => [:users, :id]
      t.integer :car_id,                 null: false, :references => [:cars, :id]
      t.datetime :rental_start,          null: false
      t.datetime :rental_finish
      t.boolean :current,                null: false, default: false
    end

    add_index :car_history, :user_id
    add_index :car_history, :car_id
  end
end
