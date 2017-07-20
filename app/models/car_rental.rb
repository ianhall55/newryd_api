class CarRental < ActiveRecord::Base
  validates :user_id, :type_id, :class_id, :price_tier_id, :rental_start_date, presence: true

  attr_accessor :status

  scope :for_user, ->(user_id) { where(user_id: user_id) }

  scope :upcoming, ->(now) { where("rental_start_date > ?", now) }
  scope :pending, -> { where(status: 'pending') }
  scope :confirmed, -> { where(status: 'confirmed') }

  belongs_to :user
  belongs_to :car,
    optional: true

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

  def confirm!(car)
    self.car = car
    self.status = 'confirmed'
    save!
  end
end
