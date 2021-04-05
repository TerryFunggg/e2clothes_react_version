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
FactoryBot.define do
  factory :order do
    order_log factory: :order_log
    state { %w[complete canceled failed processing].sample }
  end
end
