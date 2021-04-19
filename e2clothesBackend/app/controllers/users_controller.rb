class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  # skip action check Authorization head when user signUp
  skip_before_action :authorize_request, only: :signup

  # GET /users
  def index
    users = User.search(params[:q])
    @users = users.pages(page: params[:_start]) if params[:_start].present?
    response.headers['Access-Control-Expose-Headers'] = 'X-Total-Count'
    response.headers['X-Total-Count'] = @users.count
    json_response(@users)
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.is_active = false
    @user.save
    head :no_content
  end

  def signup
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user_params[:password]).call
    res = { message: Message.account_created, auth_token: auth_token }
    json_response(res, :created)
  end

  def me
    json_response(@current_user)
  end

  private

  # white list
  def user_params
    # params.permit(:first_name)
    params.permit(:email, :first_name, :last_name, :password, :phone, :role, :user_name, :is_active, :created_at,
                  :update_at)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
