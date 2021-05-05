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
class Product < ApplicationRecord
  belongs_to :shop

  validates :name, :price, presence: true
  validates :price, numericality: true

  def self.search(search)
    where(
      'name LIKE :q AND isActive = true AND quality > 0', q: "%#{search}%"
    )
  end
end
