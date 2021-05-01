module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, Types::MyTypes::UserType, null: true

    def me
      raise GraphQL::ExecutionError,"Authorization Token is required " if context[:me].nil?
      context[:me]
    end
  end
end
