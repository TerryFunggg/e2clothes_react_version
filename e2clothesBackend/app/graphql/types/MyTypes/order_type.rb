module Types
  module MyTypes
    class OrderType < Types::BaseObject
      field :id, ID, null: false
      field :user_id, Integer, null: false
      field :state, String, null: false
      field :name, String, null: false
      field :city, String, null: false
      field :streetAddress, String, null: false
      field :buildingAddress, String, null: false
      field :zipCode, String, null: false
      field :phone, String, null: false
      field :email, String, null: false
      field :code, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
