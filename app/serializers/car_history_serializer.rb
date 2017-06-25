class CarHistorySerializer < ActiveModel::Serializer
  attributes :id, :car, :rental_start, :rental_finish, :current
end
