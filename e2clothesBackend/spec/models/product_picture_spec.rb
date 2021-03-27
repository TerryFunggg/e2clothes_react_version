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
  pending "add some examples to (or delete) #{__FILE__}"
end
