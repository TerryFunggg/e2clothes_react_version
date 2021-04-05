# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  fk_rails_916f2a1419  (product_id)
#  fk_rails_ea59a35211  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe '#valid?' do
    it 'is valid when cart created' do
      cart = create(:cart)
      expect(cart).to be_valid
    end
  end

  describe '#save' do
    it 'belongs to user, product' do
      cart = Cart.new
      cart.save
      expect(cart).not_to be_persisted

      user = create(:user)
      product = create(:product)
      cart.user = user
      cart.product = product
      cart.save
      expect(cart).to be_persisted
    end
  end
end
