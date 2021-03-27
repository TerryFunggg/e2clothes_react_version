# == Schema Information
#
# Table name: shops
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  logo        :string(255)
#  slug        :string(255)
#  state       :string(255)      not null
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  address_id  :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  fk_rails_a206706856               (address_id)
#  index_shops_on_user_id_and_title  (user_id,title) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Shop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
