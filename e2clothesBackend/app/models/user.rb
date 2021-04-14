# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar     :string(255)
#  email      :string(255)      not null
#  first_name :string(255)      not null
#  is_active  :boolean          default(TRUE), not null
#  last_name  :string(255)
#  password   :string(255)      not null
#  phone      :string(255)      not null
#  role       :string(255)      default("buyer"), not null
#  user_name  :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint
#
# Indexes
#
#  fk_rails_eb2fc738e4                           (address_id)
#  index_users_on_user_name_and_email_and_phone  (user_name,email,phone) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
class User < ApplicationRecord
  include BCrypt
  belongs_to :address, optional: true
  has_many :carts
  has_many :cart_items,
           class_name: 'Product',
           through: :carts,
           source: :product
  has_one :shop
  has_many :orders

  ROLES = [
    BUYER = 'buyer'.freeze,
    SELLER = 'seller'.freeze,
    ADMIN = 'admin'.freeze
  ].freeze

  enum role: {
    buyer: BUYER,
    seller: SELLER,
    admin: ADMIN
  }

  validates :first_name, :last_name, :phone, :password, presence: true
  validates :phone, uniqueness: true,
                    length: { is: 8 },
                    numericality: true

  validates :password, length: {
    minimum: 6,
    wrong_length: 'must be a length minimnu is 6 '
  }
  validates :email, uniqueness: true, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'must be a valid email address'
  }
  validates :avatar, allow_blank: true, format: {
    with: /\.gif|jpg|png/i,
    message: 'must be a URL for GIF,JPG,PNG image'
  }

  before_save :ensure_email_downcase
  before_save :ensure_password_hash

  def password_hash
    @password_hash ||= Password.new(password)
  end

  private

  def ensure_email_downcase
    self.email = email.downcase
  end

  def ensure_password_hash
    @password_hash = Password.create(password)
    self.password = @password_hash
  end
end
