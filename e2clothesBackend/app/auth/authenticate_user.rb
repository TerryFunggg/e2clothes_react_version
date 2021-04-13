class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user_is_valid
  end

  private

  attr_reader :email, :password

  def user_is_valid
    user = User.find_by(email: email)
    return user if user && user.password_hash == password

    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
