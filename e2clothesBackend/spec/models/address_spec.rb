# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  building_address :string(255)      not null
#  city             :string(255)      not null
#  street_address   :string(255)      not null
#  zip_code         :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '#valid?' do
    it 'is valid when address created' do
      address = create(:address)
      expect(address).to be_valid
    end

    it 'is invalid when zip code is blank' do
      address = create(:address)
      address.zip_code = ''
      expect(address).to be_invalid
    end

    it 'is invalid when street address is blank' do
      address = create(:address)
      address.street_address = ''
      expect(address).to be_invalid
    end

    it 'is invalid when city is blank' do
      address = create(:address)
      address.city = ''
      expect(address).to be_invalid
    end

    it 'is invalid when building address is blank' do
      address = create(:address)
      address.building_address = ''
      expect(address).to be_invalid
    end
  end
end
