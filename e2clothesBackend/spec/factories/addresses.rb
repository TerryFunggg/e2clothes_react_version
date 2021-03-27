# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  building_address :string(255)      not null
#  city             :string(255)      not null
#  street_address   :string(255)      not null
#  zip_code         :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
FactoryBot.define do
  factory :address do
    city { "MyString" }
    street_address { "MyString" }
    building_address { "MyString" }
    zip_code { "MyString" }
  end
end
