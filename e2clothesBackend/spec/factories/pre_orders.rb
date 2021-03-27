# == Schema Information
#
# Table name: pre_orders
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  fk_rails_e135a3fa8d  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :pre_order do
    user_id { "" }
  end
end
