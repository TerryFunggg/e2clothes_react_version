module Types
  module MyTypes
    class ProductType < Types::BaseObject
      include Rails.application.routes.url_helpers
      field :id, ID, null: true
      field :shop, Types::MyTypes::ShopType, null: true
      field :name, String, null: true
      field :price, String, null: true
      field :description, String, null: true
      field :quality, Integer, null: true
      field :isActive, Boolean, null: true
      field :image, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

      def description
        object.decription
      end

      def image
          url_for(object.image) if object.image.attached?
      end
    end
  end
end
