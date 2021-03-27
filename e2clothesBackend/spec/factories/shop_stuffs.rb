# == Schema Information
#
# Table name: shop_stuffs
#
#  id         :bigint           not null, primary key
#  file       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :bigint           not null
#
# Indexes
#
#  fk_rails_7e2288f703  (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#
FactoryBot.define do
  factory :shop_stuff do
    file { "MyString" }
    shop_id { "" }
  end
end
