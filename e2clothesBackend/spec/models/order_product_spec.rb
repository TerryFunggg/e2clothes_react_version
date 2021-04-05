# == Schema Information
#
# Table name: order_products
#
#  id         :bigint           not null, primary key
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
  end

  describe '#save' do
    it 'belongs to log and product' do
      op = OrderProduct.new
      op.save
      expect(op).not_to be_persisted

      product = create(:product)
      op.product = product
      order_log = create(:order_log)
      op.order_log = order_log
      op.save
      expect(op).to be_persisted
    end
  end
end
