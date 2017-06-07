class User < ActiveRecord::Base
  has_secure_password

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
end
