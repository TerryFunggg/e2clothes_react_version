module Types
  module MyTypes
    class ProductType < Types::BaseObject
      include Rails.application.routes.url_helpers
      field :id, ID, null: false
      field :shop, Types::MyTypes::ShopType, null: false
      field :name, String, null: false
      field :price, String, null: false
      field :decription, String, null: true
      field :quality, Integer, null: true
      field :isActive, Boolean, null: false
      field :images, [String], null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

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
