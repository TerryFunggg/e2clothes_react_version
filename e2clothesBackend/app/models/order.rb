# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  state        :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  order_log_id :bigint           not null
#
# Indexes
#
#  index_orders_on_order_log_id  (order_log_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (order_log_id => order_logs.id)
#
class Order < ApplicationRecord
  belongs_to :order_log

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

  validates :state, presence: true
end
