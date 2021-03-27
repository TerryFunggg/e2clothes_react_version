# == Schema Information
#
# Table name: traffics
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  fk_rails_5ac7166f00  (product_id)
#  fk_rails_7bcbca9704  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :traffic do
    user_id { "" }
    product_id { "" }
  end
end
