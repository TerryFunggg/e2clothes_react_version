# == Schema Information
#
# Table name: addresses
#
#  id              :bigint           not null, primary key
#  buildingAddress :string(255)      not null
#  city            :string(255)      not null
#  streetAddress   :string(255)      not null
#  zipCode         :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Address < ApplicationRecord
  validates :city, :buildingAddress, :streetAddress, :zipCode, presence: true

  def self.search(search)
    where(
      "city LIKE :q
        OR buildingAddress LIKE :q
        OR streetAddress LIKE :q
        OR zipCode LIKE :q",
      q: "%#{search}%"
    )
  end
end
