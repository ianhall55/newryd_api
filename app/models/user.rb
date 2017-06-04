class User < ActiveRecord::Base
  validates :phone_number, :email, :password_digest, :session_token, presence: true
  validates :phone_number, :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password

  after_initialize :ensure_session_token

  def password=(password)
    @password = password
    pw_dig = BCrypt::Password.create(password)
    self.password_digest = pw_dig
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def generate_session_token
    SecureRandom::urlsafe_base64(32)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save
    self.session_token
  end

  def self.find_by_credentials(username, password)
    pot_user = User.find_by_username(username)
    return nil unless pot_user
    pot_user.is_password?(password) ? pot_user : nil
  end

end
