# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  category   :string(255)
#  decription :text(65535)
#  name       :string(255)      not null
#  price      :string(255)      not null
#  quality    :bigint           default(0)
#  state      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :bigint           not null
#
# Indexes
#
#  fk_rails_b169a26347     (shop_id)
#  index_products_on_name  (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#
class Product < ApplicationRecord
end