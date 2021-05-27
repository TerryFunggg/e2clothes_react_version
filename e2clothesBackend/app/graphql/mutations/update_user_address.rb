module Mutations
  class UpdateUserAddress < BaseMutation
    null true

    argument :city, String, required: false
    argument :streetAddress, String, required: false
    argument :buildingAddress, String, required: false
    argument :zipCode, String, required: false

    field :message, String, null: true
    field :me, Types::MyTypes::UserType, null: true

    def resolve(params)
      raise GraphQL::ExecutionError, 'Authorization Token is required ' if context[:me].nil?

      # Get current user
      user = context[:me]
      if user.address.nil?
        user.address = Address.new(params)
        user.save!
      else
        user.address.update(params)
      end
      { message: 'update address successfully', me: user }
    end
  end
end
