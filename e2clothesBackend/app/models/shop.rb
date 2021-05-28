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
class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :products
  validates :title, :state, presence: true
  has_one_attached :logo

  STATE = [
    UNQUALIFIED = 'UNQUALIFIED'.freeze,
    IS_OPEN = 'IS_OPEN'.freeze,
    IS_CLOSE = 'IS_CLOSE'.freeze
  ].freeze

  enum state: {
    unqualified: UNQUALIFIED,
    is_open: IS_OPEN,
    is_close: IS_CLOSE
  }

  # validates :logo, allow_blank: true, format: {
  #   with: /\.gif|jpg|png/i,
  #   message: 'must be a URL for GIF,JPG,PNG image'
  # }
end
