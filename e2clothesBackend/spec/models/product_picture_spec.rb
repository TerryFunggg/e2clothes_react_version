# == Schema Information
#
# Table name: product_pictures
#
#  id         :bigint           not null, primary key
#  img        :string(255)      not null
#  index      :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  fk_rails_58abff9e7b  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
require 'rails_helper'

RSpec.describe ProductPicture, type: :model do
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

  def create_picture
    ProductPicture.create(
      img: 'test.jpg',
      index: 0,
      product: create_product
    )
  end

  describe '#valid' do
    it 'is valid when ProductPicture object created' do
      p = create_picture
      expect(p).to be_valid
    end

    it 'should past img url format correctly' do
      p = create_picture
      p.img = ''
      expect(p).to be_valid

      p.img = 'abc'
      expect(p).not_to be_valid

      p.img = 'jpp'
      expect(p).not_to be_valid

      %w[jpg png gif].each do |format|
        p.img = "abc.#{format}"
        expect(p).to be_valid
      end
    end

    it 'is invalid when price is not a integer' do
      p = create_picture
      p.index = 'abc'
      expect(p).to be_invalid

      p.index = '123abc'
      expect(p).to be_invalid

      p.index = '123.abc'
      expect(p).to be_invalid

      # only integer
      p.index = '123.321'
      expect(p).to be_invalid

      p.index = '10'
      expect(p).to be_valid
    end
  end

  describe '#save' do
    it 'belongs to a product' do
      p = ProductPicture.new(
        img: 'test.jpg',
        index: 0
      )

      p.save
      expect(p).not_to be_persisted

      product = create_product
      p.product = product
      p.save
      expect(p).to be_persisted
    end
  end
end
