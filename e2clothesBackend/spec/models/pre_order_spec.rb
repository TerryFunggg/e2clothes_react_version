# == Schema Information
#
# Table name: pre_orders
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  fk_rails_e135a3fa8d  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe PreOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
