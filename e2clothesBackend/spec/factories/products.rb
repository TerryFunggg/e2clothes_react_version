# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  decription :text(65535)
#  is_active  :boolean          default(TRUE), not null
#  name       :string(255)      not null
#  price      :string(255)      not null
#  quality    :bigint           default(0)
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
FactoryBot.define do
  factory :product do
    shop factory: :shop
    name { 'myProduct' }
    price { ['21.0', '33.1', '40.1'].sample }
    decription { 'MyText' }
    quality { '1' }
    is_active { true }
  end
end
