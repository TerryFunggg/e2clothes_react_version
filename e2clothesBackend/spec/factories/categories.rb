# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#
FactoryBot.define do
  factory :category do
    product factory: :product
    name { 'test' }
  end
end
