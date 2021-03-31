# == Schema Information
#
# Table name: shop_stuffs
#
#  id         :bigint           not null, primary key
#  file       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :bigint           not null
#
# Indexes
#
#  fk_rails_7e2288f703  (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#
class ShopStuff < ApplicationRecord
  belongs_to :shop

  validates :file, presence: true

  validates :file, allow_blank: true, format: {
    with: /\.pdf/i,
    message: 'must be a pdf file'
  }
end
