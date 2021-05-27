# == Schema Information
#
# Table name: orders
#
#  id              :bigint           not null, primary key
#  buildingAddress :string(255)      not null
#  city            :string(255)      not null
#  code            :string(255)
#  email           :string(255)      not null
#  name            :string(255)      not null
#  phone           :string(255)      not null
#  state           :string(255)      not null
#  streetAddress   :string(255)      not null
#  zipCode         :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  fk_rails_f868b47f6a  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :order_goods,
           class_name: 'Product',
           through: :order_products,
           source: :product

  STATE = [
    COMPLETE = 'complete'.freeze,
    CANCELED = 'canceled'.freeze,
    FAILED = 'failed'.freeze,
    PROCESSING = 'processing'.freeze
  ].freeze

  enum state: {
    complete: COMPLETE,
    canceled: CANCELED,
    failed: FAILED,
    processing: PROCESSING
  }

  validates :name, :phone, :state, presence: true
  validates :city, :buildingAddress, :streetAddress, :zipCode, presence: true
  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'must be a valid email address'
  }
end
