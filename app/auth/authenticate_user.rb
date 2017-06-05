class AuthenticateUser
  def initialize(email = nil, phone_number = nil, password = '')
    @email = email
    @phone_number = phone_number
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :email, :phone_number, :password

  # verify user credentials
  def user
    user = User.find_by_creds(email: email, phone_number: phone_number)
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
