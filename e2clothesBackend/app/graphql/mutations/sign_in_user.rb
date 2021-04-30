module Mutations
  class SignInUser < BaseMutation
    null true

    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: true

    def resolve(email:, password:)
      return unless email && password

      token = AuthenticateUser.new(email, password).call
      { token: token }
    end
  end
end
