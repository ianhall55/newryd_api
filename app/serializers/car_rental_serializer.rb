class CarRentalSerializer < ActiveModel::Serializer
  attributes :id, :car, :car_type, :car_class, :price_tier, :status, :confirmed, :rental_start_date, :rental_finish_date
end
