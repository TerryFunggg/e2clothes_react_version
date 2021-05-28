class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  attr_reader :current_user

  # before_action :authorize_request

  def total_count_header(count)
    response.headers['Access-Control-Expose-Headers'] = 'X-Total-Count'
    response.headers['X-Total-Count'] = count
  end

  def current_user
    token = check_header_have_auth
    User.find(JsonWebToken.decode(token)[:user_id]) if token.present?
  end

  private
  # check every request that included authorization header and token
  # and save it to :current_user
  def authorize_request
    requests = AuthorizeApiRequest.new(request.headers).call
    @current_user = requests[:user]
  end

  def check_header_have_auth
    @headers = request.headers
    # check authorization header
    return @headers['Authorization'].to_s if @headers['Authorization'].present?
  end
end
