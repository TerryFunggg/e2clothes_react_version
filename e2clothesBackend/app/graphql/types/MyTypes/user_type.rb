module Types
  module MyTypes
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :userName, String, null: false
      field :firstName, String, null: false
      field :lastName, String, null: true
      field :email, String, null: false
      field :password, String, null: false
      field :avatar, String, null: true
      field :phone, String, null: false
      field :isActive, Boolean, null: false
      field :role, String, null: false
      field :address_id, Integer, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
