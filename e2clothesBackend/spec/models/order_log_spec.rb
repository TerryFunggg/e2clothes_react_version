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
  describe '#valid?' do
    it 'is valid when order log created' do
      log = create(:order_log)
      expect(log).to be_valid
    end
  end

  describe '#save' do
    it 'belongs to a user' do
      log = OrderLog.new

      log.save
      expect(log).not_to be_persisted

      user = create(:user)
      log.user = user
      log.save
      expect(log).to be_persisted
    end
  end
end
