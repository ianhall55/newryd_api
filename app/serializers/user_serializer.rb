class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number, :activated, :session_token, :user_type, :price_tier
end
