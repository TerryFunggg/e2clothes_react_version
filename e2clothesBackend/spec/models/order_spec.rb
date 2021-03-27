# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  state        :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  pre_order_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  fk_rails_f868b47f6a           (user_id)
#  index_orders_on_pre_order_id  (pre_order_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (pre_order_id => pre_orders.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
