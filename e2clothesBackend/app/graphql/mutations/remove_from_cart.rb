module Mutations
  class RemoveFromCart < BaseMutation
    null true

    argument :productId, ID, required: true

    field :message, String, null: true

    def resolve(productId:)
      raise GraphQL::ExecutionError,"Authorization Token is required " if context[:me].nil?
      context[:me]
      Cart.where(product_id: productId).destroy_all
      {message: "ok"}
    end
  end
end
