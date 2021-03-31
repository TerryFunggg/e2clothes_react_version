# == Schema Information
#
# Table name: shop_stuffs
#
#  id         :bigint           not null, primary key
#  file       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :bigint           not null
#
# Indexes
#
#  fk_rails_7e2288f703  (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#
require 'rails_helper'

RSpec.describe ShopStuff, type: :model do
  def create_shop(title: 'test title')
    Shop.create(
      user: create(:user),
      address: create(:address),
      title: title,
      state: Shop::UNQUALIFIED
    )
  end

  def create_stuff
    ShopStuff.create(
      file: 'test.pdf',
      shop: create_shop
    )
  end
  describe '#valid?' do
    it 'is valid when stuff created' do
      stuff = create_stuff
      expect(stuff).to be_valid
    end

    it 'is invalid when file is blank' do
      stuff = create_stuff
      stuff.file = ''
      expect(stuff).to be_invalid
    end

    it 'should past file format correctly' do
      stuff = create_stuff
      stuff.file = ''
      expect(stuff).to be_invalid

      stuff.file = 'abc'
      expect(stuff).to be_invalid

      stuff.file = 'pdf'
      expect(stuff).to be_invalid

      stuff.file = 'mytest.pdf'
      expect(stuff).to be_valid
    end
  end

  describe '#save' do
    it 'belongs to shop' do
      stuff = ShopStuff.new(
        file: 'test.pdf'
      )
      stuff.save
      expect(stuff).not_to be_persisted

      # test to be pass
      shop = Shop.new(
        title: 'testinf',
        state: Shop::UNQUALIFIED
      )
      shop.user = create(:user)
      shop.address = create(:address)

      stuff.shop = shop
      stuff.save
      expect(stuff).to be_persisted
    end
  end
end
