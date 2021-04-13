class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user = verify_user
    JsonWebToken.encode(user_id: user.id)
  end

  private

  attr_reader :email, :password

  def verify_user
    user = User.find_by(email: email)
    return user if user && user.password_hash == password

    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
