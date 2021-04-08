# == Schema Information
#
# Table name: order_products
#
#  id         :bigint           not null, primary key
#  price      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_order_products_on_order_id    (order_id)
#  index_order_products_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#
require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  describe '#valid?' do
    it 'is valid when orderProduct created' do
      op = create(:order_product)
      expect(op).to be_valid
    end

    it 'is invalid when price is not a number ' do
      op = create(:order_product)
      op.price = 'abc'
      expect(op).to be_invalid

      op.price = '123abc'
      expect(op).to be_invalid

      op.price = '123.abc'
      expect(op).to be_invalid

      op.price = '12.2'
      expect(op).to be_valid

      op.price = '10'
      expect(op).to be_valid
    end
  end

  describe '#save' do
    it 'belongs to order and product' do
      op = OrderProduct.new(
        order: create(:order),
        product: create(:product, name: 'product item 1'),
        price: '10'
      )
      op.product = nil
      op.order = nil
      op.save
      expect(op).not_to be_persisted

      product = create(:product)
      op.product = product
      order = create(:order)
      op.order = order
      op.save
      expect(op).to be_persisted
    end
  end
end
