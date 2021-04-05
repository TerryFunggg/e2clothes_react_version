# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  state        :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  order_log_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  fk_rails_f868b47f6a           (user_id)
#  index_orders_on_order_log_id  (order_log_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (order_log_id => order_logs.id)
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
end
