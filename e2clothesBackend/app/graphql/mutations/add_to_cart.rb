module Mutations
  class AddToCart < BaseMutation
    null true

    argument :productId, ID, required: true
    argument :buyNum, Integer, required: true


    field :message, String, null: true

    def resolve(productId:, buyNum:)
      raise GraphQL::ExecutionError,"Authorization Token is required " if context[:me].nil?
      context[:me]
      buyNum.times { Cart.create!(product_id: productId, user_id: context[:me].id) }
      {message: "ok"}
    end
  end
end
