# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  avatar        :string(255)
#  email         :string(255)      not null
#  firstName     :string(255)      not null
#  isActive      :boolean          default(TRUE), not null
#  lastName      :string(255)
#  password_hash :string(255)      not null
#  phone         :string(255)      not null
#  role          :string(255)      default("buyer"), not null
#  userName      :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  address_id    :bigint
#
# Indexes
#
#  fk_rails_eb2fc738e4   (address_id)
#  index_users_on_email  (email) UNIQUE
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

  validates :firstName, :lastName, :phone, :password, presence: true
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

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.search(search)
    where(
      "id LIKE :q
        OR userName LIKE :q
        OR firstName LIKE :q
        OR lastName LIKE :q
        OR email LIKE :q
        OR phone LIKE :q",
      q: "%#{search}%"
    )
  end

  private

  def ensure_email_downcase
    self.email = email.downcase
  end
end
