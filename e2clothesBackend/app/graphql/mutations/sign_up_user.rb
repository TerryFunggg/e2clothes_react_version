module Mutations
  class SignUpUser < BaseMutation
    null true

    argument :email, String, required: true
    argument :password, String, required: true
    argument :firstName, String, required: true
    argument :lastName, String, required: true
    argument :userName, String, required: true
    argument :phone, String, required: true

    field :token, String, null: true

    def resolve(user)
      return unless user.present?

      new_user = User.new(user)
      new_user.password = user[:password]

      new_user.save!

      token = AuthenticateUser.new(new_user.email, user[:password]).call
      { token: token }
    end
  end
end
