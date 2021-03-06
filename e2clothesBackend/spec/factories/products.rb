# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  decription :text(65535)
#  isActive   :boolean          default(TRUE), not null
#  name       :string(255)      not null
#  price      :string(255)      not null
#  quality    :bigint           default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :bigint           not null
#
# Indexes
#
#  fk_rails_b169a26347  (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#
require 'faker'

FactoryBot.define do
  factory :product do
    shop factory: :shop
    name { Faker::Name.name }
    price { ['21.0', '33.1', '40.1'].sample }
    decription { 'MyText' }
    quality { '1' }
    is_active { true }
  end
end
