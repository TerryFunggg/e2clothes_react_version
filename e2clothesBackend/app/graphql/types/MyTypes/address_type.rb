module Types
  module MyTypes
    class AddressType < Types::BaseObject
      field :id, ID, null: false
      field :city, String, null: false
      field :streetAddress, String, null: false
      field :buildingAddress, String, null: false
      field :zipCode, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
