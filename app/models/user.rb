class User < ActiveRecord::Base
  has_secure_password

  belongs_to :current_car,
    class_name: 'Car',
    primary_key: :id,
    foreign_key: :car_id,
    optional: true

  has_many :car_histories,
    class_name: 'CarHistory',
    primary_key: :id,
    foreign_key: :user_id

  has_many :cars,
    through: :car_histories

  belongs_to :price_tier,
    optional: true

  validates :phone_number, :email, :password_digest, presence: true
  validates :phone_number, :email, uniqueness: true

  attr_reader :password

  def self.find_by_creds(options = {})
    if options[:phone_number]
      pot_user = User.find_by_phone_number(options[:phone_number])
    elsif options[:email]
      pot_user = User.find_by_email(options[:email])
    end
    pot_user
  end

  def update_price_tier(price_tier_id)
    user_price_tier = PriceTier.where(id: price_tier_id).first
    if user_price_tier
      self.price_tier = user_price_tier
      self.save!
    else
      false
    end
  end

  def to_json
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      email: email,
      phone_number: phone_number,
      user_type: user_type,
      price_tier: {
        id: price_tier.id,
        start_price: price_tier.start_price,
        end_price: price_tier.end_price,
        description: price_tier.description
      }
    }
  end
end
