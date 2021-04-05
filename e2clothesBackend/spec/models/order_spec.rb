# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  state      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  fk_rails_f868b47f6a  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
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
    it 'belongs to user' do
      order = Order.new(
        state: Order::PROCESSING
      )
      order.save
      expect(order).not_to be_persisted

      order.user = create(:user)
      order.save
      expect(order).to be_persisted
    end
  end
end
