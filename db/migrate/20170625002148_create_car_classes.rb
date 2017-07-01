class CreateCarClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :car_classes do |t|
      t.string :name,            null: false
      t.string :description
    end

    add_index :car_classes, :name, unique: true
  end
end
