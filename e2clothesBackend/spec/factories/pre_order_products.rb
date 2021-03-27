# == Schema Information
#
# Table name: pre_order_products
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  pre_order_id :bigint           not null
#  product_id   :bigint           not null
#
# Indexes
#
#  fk_rails_285dd5bffe  (pre_order_id)
#  fk_rails_dabeb957a7  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (pre_order_id => pre_orders.id)
#  fk_rails_...  (product_id => products.id)
#
FactoryBot.define do
  factory :pre_order_product do
    product_id { "" }
  end
end
