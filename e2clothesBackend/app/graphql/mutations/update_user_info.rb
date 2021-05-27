module Mutations
  class UpdateUserInfo < BaseMutation
    null true

    argument :email, String, required: false
    argument :firstName, String, required: false
    argument :lastName, String, required: false
    argument :userName, String, required: false
    argument :phone, String, required: false

    field :message, String, null: true
    field :me, Types::MyTypes::UserType, null: true

    def resolve(params)
      raise GraphQL::ExecutionError,"Authorization Token is required " if context[:me].nil?
      # Get current user
      user = context[:me]
      user.update params
      { message: 'update user successfully', me: user }
    end
  end
end
