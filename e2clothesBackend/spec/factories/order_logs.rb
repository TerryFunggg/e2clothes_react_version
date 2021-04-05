# == Schema Information
#
# Table name: order_logs
#
#  id         :bigint           not null, primary key
#  order_code :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_order_logs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :order_log do
    user factory: :user
    order_code { 'sdasAsfas' }
  end
end
