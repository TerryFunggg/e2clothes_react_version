module Mutations
  class DeleteProduct < BaseMutation
    null true

    argument :productId, ID, required: true

    field :message, String, null: true

    def resolve(productId:)
      raise GraphQL::ExecutionError,"Authorization Token is required " if context[:me].nil?
      Product.find(productId).destroy
      {message: "ok"}
    end
  end
end
