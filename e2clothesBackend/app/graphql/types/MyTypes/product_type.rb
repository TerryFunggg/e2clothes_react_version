module Types
  module MyTypes
    class ProductType < Types::BaseObject
      field :id, ID, null: false
      field :shop, Types::MyTypes::ShopType, null: false
      field :name, String, null: false
      field :price, String, null: false
      field :decription, String, null: true
      field :quality, Integer, null: true
      field :isActive, Boolean, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
