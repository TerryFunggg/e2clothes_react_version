# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  decription :text(65535)
#  is_active  :boolean          default(TRUE), not null
#  name       :string(255)      not null
#  price      :string(255)      not null
#  quality    :bigint           default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :bigint           not null
#
# Indexes
#
#  fk_rails_b169a26347     (shop_id)
#  index_products_on_name  (name) UNIQUE
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

  describe '#valid?' do
  end
end
