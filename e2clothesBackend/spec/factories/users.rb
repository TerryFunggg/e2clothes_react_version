# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string(255)
#  email      :string(255)      not null
#  first_name :string(255)      not null
#  is_active  :boolean          default(TRUE), not null
#  last_name  :string(255)
#  password   :string(255)      not null
#  phone      :string(255)      not null
#  role       :string(255)      default("buyer"), not null
#  user_name  :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint
#
# Indexes
#
#  fk_rails_eb2fc738e4                           (address_id)
#  index_users_on_user_name_and_email_and_phone  (user_name,email,phone) UNIQUE
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
