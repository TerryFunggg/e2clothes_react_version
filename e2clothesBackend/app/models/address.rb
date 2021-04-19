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
class Address < ApplicationRecord
  validates :city, :building_address, :street_address, :zip_code, presence: true

  def self.search(search)
    where(
      "city LIKE :q
        OR building_address LIKE :q
        OR street_address LIKE :q
        OR zip_code LIKE :q",
      q: "%#{search}%"
    )
  end
end
