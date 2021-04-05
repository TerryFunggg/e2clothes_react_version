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
require 'rails_helper'

RSpec.describe OrderLog, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
