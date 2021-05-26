module Types
  class MutationType < Types::BaseObject
    field :test_field, String, null: false, description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end

    field :sign_in_user, mutation: Mutations::SignInUser
    field :sign_up_user, mutation: Mutations::SignUpUser
    field :add_to_cart, mutation: Mutations::AddToCart
    field :remove_from_cart, mutation: Mutations::RemoveFromCart
  end
end
