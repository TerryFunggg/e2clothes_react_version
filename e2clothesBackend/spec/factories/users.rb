# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  avatar        :string(255)
#  email         :string(255)      not null
#  firstName     :string(255)      not null
#  isActive      :boolean          default(TRUE), not null
#  lastName      :string(255)
#  password_hash :string(255)      not null
#  phone         :string(255)      not null
#  role          :string(255)      default("buyer"), not null
#  userName      :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  address_id    :bigint
#
# Indexes
#
#  fk_rails_eb2fc738e4   (address_id)
#  index_users_on_email  (email) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
require 'faker'

FactoryBot.define do
  factory :user do
    user_name { Faker::Name.name }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    is_active { true }
    password { Faker::Internet.password(min_length: 8) }
    phone { Faker::Number.number(digits: 8) }
    role { %w[buyer seller admin].sample }
  end
end
