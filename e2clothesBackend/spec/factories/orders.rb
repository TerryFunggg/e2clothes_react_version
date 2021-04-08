# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  building_address :string(255)      not null
#  city             :string(255)      not null
#  code             :string(255)
#  email            :string(255)      not null
#  name             :string(255)      not null
#  phone            :string(255)      not null
#  state            :string(255)      not null
#  street_address   :string(255)      not null
#  zip_code         :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  fk_rails_f868b47f6a  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :order do
    user factory: :user
    state { %w[complete canceled failed processing].sample }
    name { Faker::FunnyName.name }
    email { Faker::Internet.email }
    phone { Faker::Number.number(digits: 8) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_address { Faker::Address.building_number }
    zip_code { SecureRandom.hex(5) }
  end
end
