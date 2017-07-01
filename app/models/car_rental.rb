class CarRental < ActiveRecord::Base
  validates :user_id, :type_id, :class_id, :price_tier_id, :rental_start_date, presence: true

  before_create :set_user

  belongs_to :user
  belongs_to :car
  belongs_to :car_type
  belongs_to :car_class
  belongs_to :price_tier


  def set_user
    if current_user && current_user.activated
      user_id = current_user.id
    else
      errors.add(:user, "User must be logged in and activated")
    end
  end
end
