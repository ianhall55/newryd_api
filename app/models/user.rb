class User < ActiveRecord::Base
  has_secure_password

  validates :phone_number, :email, :password_digest, :session_token, presence: true
  validates :phone_number, :email, uniqueness: true

  attr_reader :password

  # after_initialize :ensure_session_token

  def self.find_by_creds(options = {})
    if options[:phone_number]
      pot_user = User.find_by_phone_number(options[:phone_number])
    elsif options[:email]
      pot_user = User.find_by_email(options[:email])
    end
    pot_user
    
  end

  # def password=(password)
  #   @password = password
  #   pw_dig = BCrypt::Password.create(password)
  #   self.password_digest = pw_dig
  # end
  #
  # def is_password?(password)
  #   BCrypt::Password.new(self.password_digest).is_password?(password)
  # end
  #
  # def generate_session_token
  #   SecureRandom::urlsafe_base64(32)
  # end
  #
  # def ensure_session_token
  #   self.session_token ||= generate_session_token
  # end
  #
  # def reset_session_token!
  #   self.session_token = generate_session_token
  #   self.save
  #   self.session_token
  # end
  #

end
