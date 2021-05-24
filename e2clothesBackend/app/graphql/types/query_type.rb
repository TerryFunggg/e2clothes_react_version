module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, Types::MyTypes::UserType, null: true

    field :users, [Types::MyTypes::UserType], null: true

    field :search, [Types::MyTypes::ProductType], null: true do
      argument :search, String, required: true
    end

    field :product, Types::MyTypes::ProductType, null: true do
      argument :id, ID, required: true
    end

    def me
      raise GraphQL::ExecutionError,"Authorization Token is required " if context[:me].nil?
      context[:me]
    end

    def users
      User.all
    end

    def product(id:)
      Product.find(id)
    end

    # Pagiation
    def search(search:)
      products = Product.search(search)
      if products.size > 0
        products
      else
        []
      end
    end
  end
end
