module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, Types::MyTypes::UserType, null: true

    field :product, [Types::MyTypes::ProductType], null: true do
      argument :search, String, required: true
    end

    def me
      raise GraphQL::ExecutionError,"Authorization Token is required " if context[:me].nil?
      context[:me]
    end

    # Pagiation
    def product(search:)
      products = Product.search(search)
      if products.size > 0
        products
      else
        []
      end
    end
  end
end
