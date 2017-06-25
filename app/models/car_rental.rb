class CarRental < ActiveRecord::Base

  belongs_to :user
  belongs_to :car
  belongs_to :type_id
  belongs_to :price_tier


end
