class CarRentalSerializer < ActiveModel::Serializer
  attributes :id, :car, :car_type, :car_class, :price_tier, :status, :rental_start_date
end
