module ExceptionHandler
  extend ActiveSupport::Concern

  # Define some JWT error class
  class AuthenticationError < StandardError; end

  class MissingToken < StandardError; end

  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :code_four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :code_four_zero_one
    rescue_from ExceptionHandler::MissingToken, with: :code_four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :code_four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end
  end

  private

  # Status code 422 - unprocessable entity
  def code_four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  # Status code 401 - Unauthorized
  def code_four_zero_one(e)
    json_response({ message: e.message }, :unauthorized)
  end
end
