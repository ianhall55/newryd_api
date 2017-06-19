class User < ActiveRecord::Base
  has_secure_password

  belongs_to :current_car,
    class_name: 'Car',
    primary_key: :id,
    foreign_key: :car_id

  has_many :car_histories,
    class_name: 'CarHistory',
    primary_key: :id,
    foreign_key: :user_id

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

  def to_json
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      email: email,
      phone_number: phone_number,
      user_type: user_type
    }
  end
end
