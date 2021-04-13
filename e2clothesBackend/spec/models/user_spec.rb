# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string(255)
#  email      :string(255)      not null
#  first_name :string(255)      not null
#  is_active  :boolean          not null
#  last_name  :string(255)
#  password   :string(255)      not null
#  phone      :string(255)      not null
#  role       :string(255)      not null
#  user_name  :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint
#
# Indexes
#
#  fk_rails_eb2fc738e4                           (address_id)
#  index_users_on_user_name_and_email_and_phone  (user_name,email,phone) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  describe '#valid?' do
    it 'is valid when user is created' do
      user1 = create(:user)
      expect(user1).to be_valid
    end

    it 'is invalid when email is taken' do
      user1 = create(:user, email: 'terry@example.com')
      user2 = create(:user)
      user2.email = 'terry@example.com'
      expect(user2).not_to be_valid
    end

    it 'is invalid if the email look like this' do
      user = create(:user)

      user.email = ''
      expect(user).to be_invalid

      user.email = 'test'
      expect(user).to be_invalid

      user.email = 'text.com'
      expect(user).to be_invalid

      user.email = 'text@gmail.'
      expect(user).to be_invalid

      user.email = 'text#gmail.com'
      expect(user).to be_invalid

      user.email = 'test@gmail.com'
      expect(user).to be_valid

      user.email = 'test_somone@gmail.com'
      expect(user).to be_valid

      user.email = 'test.xzc.abc.somone@gmail.com'
      expect(user).to be_valid
    end

    it 'is invalid when phone is taken' do
      user = create(:user, phone: '98767654')
      user2 = create(:user)
      user2.phone = '98767654'
      expect(user2).not_to be_valid
    end

    it 'is invalid when phone like this' do
      user = create(:user)
      user.phone = ''
      expect(user).not_to be_valid

      user.phone = '123'
      expect(user).not_to be_valid

      user.phone = 'abcd'
      expect(user).not_to be_valid

      user.phone = '98765464'
      expect(user).to be_valid
    end

    it 'is invalid when first_name is blank' do
      user = create(:user)
      user.first_name = ''
      expect(user).not_to be_valid
    end

    it 'is invalid when last_name is blank' do
      user = create(:user)
      user.last_name = ''
      expect(user).not_to be_valid
    end

    it 'should past avatar url format correctly' do
      user = create(:user)
      user.avatar = ''
      expect(user).to be_valid

      user.avatar = 'abc'
      expect(user).not_to be_valid

      user.avatar = 'jpp'
      expect(user).not_to be_valid

      %w[jpg png gif].each do |format|
        user.avatar = "abc.#{format}"
        expect(user).to be_valid
      end

      user.avatar = Faker::Avatar.image(slug: 'my-own-slug')
      expect(user).to be_valid
    end

    it 'should test password correctly' do
      user = create(:user)

      user.password = ''
      expect(user).to be_invalid

      user.password = nil
      expect(user).to be_invalid

      user.password = '123'
      expect(user).to be_invalid

      user.password = 'FRO432'
      expect(user).to be_valid
    end

    it 'is invalid when role is not included' do
      user = create(:user)

      user.role = ''
      expect(user).to be_invalid

      user.role = nil
      expect(user).to be_invalid
    end

    it 'is invalid when role is not included' do
      user = create(:user)

      user.role = ''
      expect(user).to be_invalid

      user.role = nil
      expect(user).to be_invalid
    end
  end
  describe '#save' do
    it 'downcase the email correctly' do
      user = create(:user)
      user2 = create(:user)

      user.email = 'tesT@gmail.com'
      user.save

      user2.email = 'JustForTesting@gmail.com'
      user2.save

      expect(user.email).to eq 'test@gmail.com'
      expect(user2.email).to eq 'justfortesting@gmail.com'
    end

    it 'hash the password correctly' do
      user = create(:user)

      user.password = 'testmypassowrd'
      user.save

      expect(user.password_hash).to eq 'testmypassowrd'
    end
  end

  describe '#associations' do
    it 'have many cart items' do
      user = create(:user)
      product1 = create(:product, name: 'prodcut 1')
      product2 = create(:product, name: 'product 2')

      Cart.create(
        user: user,
        product: product1
      )
      Cart.create(
        user: user,
        product: product2
      )

      expect(user.cart_items).to include(product1, product2)
    end

    it 'have one shop or nil' do
      user = create(:user)
      shop = create(:shop, user: user)
      expect(user.shop).to eq(shop)
    end

    it 'have many order' do
      user = create(:user)
      order1 = create(:order, user: user)
      order2 = create(:order, user: user)
      expect(user.orders).to include(order1, order2)
    end
  end
end
