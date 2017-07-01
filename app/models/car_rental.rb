class CarRental < ActiveRecord::Base
  validates :user_id, :type_id, :class_id, :price_tier_id, :rental_start_date, presence: true

  belongs_to :user
  # belongs_to :car

  belongs_to :car_type,
    class_name: 'CarType',
    primary_key: :id,
    foreign_key: :type_id

  belongs_to :car_class,
    class_name: 'CarClass',
    primary_key: :id,
    foreign_key: :class_id

  belongs_to :price_tier,
    class_name: 'PriceTier',
    primary_key: :id,
    foreign_key: :price_tier_id

end
