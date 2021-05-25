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
      field :images, [String], null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

      def description
        object.decription
      end

      def images
        # return unless object.images.attached?
        list = []
        object.images.each do |img|
          list << url_for(img)
        end
        list
      end
    end
  end
end
