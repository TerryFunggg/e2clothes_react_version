# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  building_address :string(255)      not null
#  city             :string(255)      not null
#  code             :string(255)
#  email            :string(255)      not null
#  name             :string(255)      not null
#  phone            :string(255)      not null
#  state            :string(255)      not null
#  street_address   :string(255)      not null
#  zip_code         :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  fk_rails_f868b47f6a  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'
require 'faker'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    it 'is valid when ordercreated' do
      order = create(:order)
      expect(order).to be_valid
    end
    it 'is invalid when name is blank' do
      order = create(:order)
      order.name = ''
      expect(order).to be_invalid
    end

    it 'is invalid when email is blank' do
      order = create(:order)
      order.email = ''
      expect(order).to be_invalid
    end

    it 'is invalid when phone is blank' do
      order = create(:order)
      order.phone = ''
      expect(order).to be_invalid
    end

    it 'is invalid when city is blank' do
      order = create(:order)
      order.city = ''
      expect(order).to be_invalid
    end
    it 'is invalid when building address is blank' do
      order = create(:order)
      order.building_address = ''
      expect(order).to be_invalid
    end
    it 'is invalid when street_address is blank' do
      order = create(:order)
      order.street_address = ''
      expect(order).to be_invalid
    end
    it 'is invalid when zip_code is blank' do
      order = create(:order)
      order.zip_code = ''
      expect(order).to be_invalid
    end

    it 'is invalid if the email look like this' do
      order = create(:order)

      order.email = ''
      expect(order).to be_invalid

      order.email = 'test'
      expect(order).to be_invalid

      order.email = 'text.com'
      expect(order).to be_invalid

      order.email = 'text@gmail.'
      expect(order).to be_invalid

      order.email = 'text#gmail.com'
      expect(order).to be_invalid

      order.email = 'test@gmail.com'
      expect(order).to be_valid

      order.email = 'test_somone@gmail.com'
      expect(order).to be_valid

      order.email = 'test.xzc.abc.somone@gmail.com'
      expect(order).to be_valid
    end
  end

  describe '#save' do
    it 'belongs to user' do
      order = Order.new(
        state: Order::PROCESSING,
        name: Faker::FunnyName.name,
        email: Faker::Internet.email,
        phone: Faker::Number.number(digits: 8),
        city: Faker::Address.city,
        street_address: Faker::Address.street_address,
        building_address: Faker::Address.building_number,
        zip_code: SecureRandom.hex(5)
      )
      order.save
      expect(order).not_to be_persisted

      order.user = create(:user)
      order.save
      expect(order).to be_persisted
    end
  end
end
