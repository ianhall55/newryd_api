class AuthenticateUser
  def initialize(email = nil, phone_number = nil, password = '')
    @email = email
    @phone_number = phone_number
    @password = password
  end

  # Service entry point
  def call
    user = verify_user
    token = JsonWebToken.encode(user: UserSerializer.new(user)) if user
    return token
  end

  private

  attr_reader :email, :phone_number, :password

  # verify user credentials
  def verify_user
    user = User.find_by_creds(email: email, phone_number: phone_number)
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
