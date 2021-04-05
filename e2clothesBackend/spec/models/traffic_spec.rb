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
require 'rails_helper'

RSpec.describe Traffic, type: :model do
  describe '#valid?' do
    it 'is valid when traffic created' do
      t = create(:traffic)
      expect(t).to be_valid
    end
  end

  describe '#save' do
    it 'belongs to user and product' do
      t = Traffic.new
      t.save
      expect(t).not_to be_persisted

      user = create(:user)
      product = create(:product)
      t.user = user
      t.product = product
      t.save
      expect(t).to be_persisted
    end
  end
end
