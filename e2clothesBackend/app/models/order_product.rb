# == Schema Information
#
# Table name: order_products
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  order_log_id :bigint           not null
#  product_id   :bigint           not null
#
# Indexes
#
#  index_order_products_on_order_log_id  (order_log_id)
#  index_order_products_on_product_id    (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_log_id => order_logs.id)
#  fk_rails_...  (product_id => products.id)
#
class OrderProduct < ApplicationRecord
  belongs_to :order_log
  belongs_to :product
end
