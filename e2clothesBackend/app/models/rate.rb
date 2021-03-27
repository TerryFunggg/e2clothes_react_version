# == Schema Information
#
# Table name: rates
#
#  id         :bigint           not null, primary key
#  rate       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  fk_rails_4a29085ce0  (user_id)
#  fk_rails_ff1b21d7f5  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Rate < ApplicationRecord
end
