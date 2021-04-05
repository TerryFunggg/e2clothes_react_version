# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#
require 'rails_helper'

RSpec.describe Category, type: :model do
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

  def create_category(name: 'text')
    Category.create(
      name: name,
      product: create_product
    )
  end

  describe '#valid?' do
    it 'is valid when category created' do
      product = create_product
      expect(product).to be_valid
    end

    it 'is invalid when name is blank' do
      c = create_category
      c.name = ''
      expect(c).to be_invalid
    end
  end

  describe '#save?' do
    it 'belongs to a product' do
      c = Category.new(
        name: 'test'
      )
      c.save
      expect(c).not_to be_persisted

      product = create_product
      c.product = product
      c.save
      expect(c).to be_persisted
    end
  end
end
