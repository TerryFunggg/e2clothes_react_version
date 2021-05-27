module Types
  class MutationType < Types::BaseObject
    field :sign_in_user, mutation: Mutations::SignInUser
    field :sign_up_user, mutation: Mutations::SignUpUser
    field :add_to_cart, mutation: Mutations::AddToCart
    field :remove_from_cart, mutation: Mutations::RemoveFromCart
    field :update_user_info, mutation: Mutations::UpdateUserInfo
    field :update_user_address, mutation: Mutations::UpdateUserAddress
  end
end
