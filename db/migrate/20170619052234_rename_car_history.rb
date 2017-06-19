class RenameCarHistory < ActiveRecord::Migration[5.0]
  def change
    rename_table :car_history, :car_histories
  end
end
