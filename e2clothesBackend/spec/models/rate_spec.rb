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
require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe '#valid?' do
    it 'is valid when rate created' do
      rate = create(:rate)
      expect(rate).to be_valid
    end

    it 'is invalid when rate is empty' do
      r = create(:rate)
      r.rate = ''
      expect(r).to be_invalid
    end

    it 'is invalid when rate is not a integer' do
      r = create(:rate)
      r.rate = 'abc'
      expect(r).to be_invalid
      r.rate = 'abc.123'
      expect(r).to be_invalid
      r.rate = '10.2'
      expect(r).to be_invalid
      r.rate = '0.1'
      expect(r).to be_invalid
      r.rate = '4'
      expect(r).to be_valid
    end

    it 'is invalid when rate more than 5' do
      r = create(:rate)
      r.rate = '6'
      expect(r).to be_invalid
    end
  end

  describe '#save' do
    it 'belongs to a user and product' do
      r = Rate.new(rate: 1)
      r.save
      expect(r).not_to be_persisted

      user = create(:user)
      product = create(:product)
      r.user = user
      r.product = product
      r.save
      expect(r).to be_persisted
    end
  end
end
