# == Schema Information
#
# Table name: addresses
#
#  id              :bigint           not null, primary key
#  buildingAddress :string(255)      not null
#  city            :string(255)      not null
#  streetAddress   :string(255)      not null
#  zipCode         :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :address do
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_address { Faker::Address.building_number }
    zip_code { SecureRandom.hex(5) }
  end
end
