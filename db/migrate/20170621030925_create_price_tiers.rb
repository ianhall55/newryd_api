class CreatePriceTiers < ActiveRecord::Migration[5.0]
  def change
    create_table :price_tiers do |t|
      t.string    :description
      t.decimal   :start_price,    null: false
      t.decimal   :end_price,      null: false
    end
  end
end
