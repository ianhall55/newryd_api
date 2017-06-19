class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :street,            null: false
      t.string :city,              null: false
      t.string :state,             null: false
      t.string :zipcode,           null: false
      t.string :name
      t.string :instructions
      t.integer :user_id,          null: false, :references => [:users, :id]
    end
  end
end
