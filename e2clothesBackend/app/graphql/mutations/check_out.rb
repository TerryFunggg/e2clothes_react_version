module Mutations
  class CheckOut < BaseMutation
    null true

    field :message, String, null: true

    def resolve
      raise GraphQL::ExecutionError, 'Authorization Token is required ' if context[:me].nil?

      # check address
      me = context[:me]
      return { message: 'address is empty'} if me.address.nil?
      # select the cart items by user,
      user_cart = Cart.where(user_id: me.id)
      return { message: 'Cart is empty' } if user_cart.blank?

      # Create order
      order = Order.create(
        email: me.email,
        name: "#{me.firstName} #{me.lastName}",
        phone: me.phone,
        city: me.address.city,
        buildingAddress: me.address.buildingAddress,
        streetAddress: me.address.streetAddress,
        zipCode: me.address.zipCode,
        user_id: me.id,
        state: Order::PROCESSING
      )
      # move items to order_cart table
      user_cart.each do |cart|
        product = cart.product
        OrderProduct.create(
          product_id: product.id,
          price: product.price,
          order_id: order.id
        )
      end
      # remove cart
      user_cart.delete_all

      { message: 'ok' }
    end
  end
end
