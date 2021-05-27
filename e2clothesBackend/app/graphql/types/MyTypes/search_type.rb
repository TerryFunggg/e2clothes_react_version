module Types
  module MyTypes
    class SearchType < Types::BaseObject
      field :products, [Types::MyTypes::ProductType], null: false
      field :page, Integer, "current page", null: true
      field :per, Integer, "per item each page", null: true
      field :total, Integer,"total count", null: true
    end
  end
end
