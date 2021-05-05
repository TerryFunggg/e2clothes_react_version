module Types
  module MyTypes
    class ShopType < Types::BaseObject
      field :id, ID, null: false
      field :address, Types::MyTypes::AddressType, null: false
      field :user, Types::MyTypes::UserType, null: false
      field :logo, String, null: true
      field :title, String, null: false
      field :slug, String, null: true
      field :description, String, null: true
      field :state, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
