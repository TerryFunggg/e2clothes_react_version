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
      field :address, Types::MyTypes::AddressType, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :numOfCart, Integer, null: true
      field :cart, [Types::MyTypes::ProductType], null: true
      field :orders, [Types::MyTypes::OrderType], null: true

      def numOfCart
        object.carts.count
      end

      def cart
        object.cart_items
      end

      def orders
        object.orders
      end
    end
  end
end
