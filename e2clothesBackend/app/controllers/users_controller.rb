class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
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
