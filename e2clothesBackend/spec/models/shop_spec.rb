# == Schema Information
#
# Table name: shops
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  logo        :string(255)
#  slug        :string(255)
#  state       :string(255)      not null
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  address_id  :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  fk_rails_a206706856               (address_id)
#  index_shops_on_user_id_and_title  (user_id,title) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Shop, type: :model do
  def create_shop(title: 'test title')
    Shop.create(
      user: create(:user),
      address: create(:address),
      title: title,
      state: Shop::UNQUALIFIED
    )
  end
  describe '#valid?' do
    it 'is valid when shop created' do
      shop = create_shop
      expect(shop).to be_valid
    end

    it 'is invalid when title is blank' do
      shop = create_shop
      shop.title = ''
      expect(shop).to be_invalid
    end

    it 'should validate the status correctly' do
      shop = create_shop

      Shop::STATE.each do |state|
        shop.state = state
        expect(shop).to be_valid
      end
    end

    it 'should past logo url format correctly' do
      shop = create_shop
      shop.logo = ''
      expect(shop).to be_valid

      shop.logo = 'abc'
      expect(shop).to be_invalid

      shop.logo = 'jpp'
      expect(shop).to be_invalid

      %w[jpg png gif].each do |format|
        shop.logo = "abc.#{format}"
        expect(shop).to be_valid
      end

      shop.logo = Faker::Avatar.image(slug: 'my-own-slug')
      expect(shop).to be_valid
    end
  end

  describe '#save' do
    it 'belongs to a user' do
      user = create(:user)
      address = create(:address)

      shop = Shop.new(
        title: 'testinf',
        state: Shop::UNQUALIFIED
      )

      shop.address = address
      shop.save
      expect(shop).not_to be_persisted

      shop.user = user
      shop.save
      expect(shop).to be_persisted
    end

    it 'belongs to a address' do
      user = create(:user)
      address = create(:address)

      shop = Shop.new(
        title: 'testinf',
        state: Shop::UNQUALIFIED
      )

      shop.user = user
      shop.save
      expect(shop).not_to be_persisted

      shop.address = address
      shop.save
      expect(shop).to be_persisted
    end
  end
end
