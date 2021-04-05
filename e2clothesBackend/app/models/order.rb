# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  state      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
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
