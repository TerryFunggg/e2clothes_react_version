class AuthenticationController < ApplicationController
  def authenticate
    jwt_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(token: jwt_token)
  end

  def auth_params
    params.permit(:email, :password)
  end
end
