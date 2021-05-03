# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  decription :text(65535)
#  isActive   :boolean          default(TRUE), not null
#  name       :string(255)      not null
#  price      :string(255)      not null
#  quality    :bigint           default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :bigint           not null
#
# Indexes
#
#  fk_rails_b169a26347  (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  def create_shop(title: 'test title')
    Shop.create(
      user: create(:user),
      address: create(:address),
      title: title,
      state: Shop::UNQUALIFIED
    )
  end

  def create_product(name: 'test')
    Product.create(
      name: name,
      price: '32.0',
      quality: 2,
      shop: create_shop
    )
  end

  describe '#valid?' do
    it 'is valid when product created' do
      product = create_product
      expect(product).to be_valid
    end

    it 'is invalid when name is blank' do
      product = create_product
      product.name = ''
      expect(product).to be_invalid
    end

    it 'is invalid when price is blank' do
      product = create_product
      product.price = ''
      expect(product).to be_invalid
    end

    it 'is invalid when price is not a number' do
      product = create_product
      product.price = 'abc'
      expect(product).to be_invalid

      product.price = '123abc'
      expect(product).to be_invalid

      product.price = '123.abc'
      expect(product).to be_invalid
    end

    it 'is return true when product is active' do
      product = create_product
      expect(product.is_active).to eq true
    end

    it 'is return false when product is not active' do
      product = create_product
      product.is_active = !product.is_active
      expect(product.is_active).to eq false
    end
  end

  describe '#save' do
    it 'belongs to a shop' do
      product = Product.create(
        name: 'test',
        price: '32.0',
        quality: 2
      )

      product.save
      expect(product).not_to be_persisted

      shop = create_shop
      product.shop = shop
      product.save
      expect(product).to be_persisted
    end
  end
end
