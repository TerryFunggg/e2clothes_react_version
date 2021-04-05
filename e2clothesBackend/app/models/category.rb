# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#
class Category < ApplicationRecord
  belongs_to :product

  validates :name, presence: true
end
