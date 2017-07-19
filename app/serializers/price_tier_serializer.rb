class PriceTierSerializer < ActiveModel::Serializer
  attributes :id, :start_price, :end_price, :description
end
