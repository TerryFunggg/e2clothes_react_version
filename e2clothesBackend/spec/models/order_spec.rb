# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  state        :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  order_log_id :bigint           not null
#
# Indexes
#
#  index_orders_on_order_log_id  (order_log_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (order_log_id => order_logs.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    it 'is valid when ordercreated' do
      order = create(:order)
      expect(order).to be_valid
    end
  end

  describe '#save' do
    it 'belongs to order log' do
      order = Order.new(
        state: Order::PROCESSING
      )
      order.save
      expect(order).not_to be_persisted

      order.order_log = create(:order_log)
      order.save
      expect(order).to be_persisted
    end
  end
end
