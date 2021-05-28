module Types
  module MyTypes
    class ShopType < Types::BaseObject
      include Rails.application.routes.url_helpers
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
      field :products, [Types::MyTypes::ProductType], null: false

      def logo
        url_for(object.logo) if object.logo.attached?
      end

      def products
        object.products
      end
    end
  end
end
