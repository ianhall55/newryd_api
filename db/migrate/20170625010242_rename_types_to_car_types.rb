class RenameTypesToCarTypes < ActiveRecord::Migration[5.0]
  def change
    rename_table :types, :car_types
  end
end
