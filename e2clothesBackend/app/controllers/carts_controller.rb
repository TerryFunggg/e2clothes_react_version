class CartsController < ApplicationController
  before_action :set_cart, only: %i[show destroy]

  # GET /carts
  def index
    @carts = Cart.all
    json_response(@carts)
  end

  # POST /carts
  def create
    @cart = Cart.create!(cart_params)
    json_response(@cart, :created)
  end

  # GET /carts/:id
  def show
    json_response(@cart)
  end

  # DELETE /carts/:id
  def destroy
    @cart.destroy
    head :no_content
  end

  private

  # white list
  def cart_params
    params.permit(:user_id, :product_id)
  end

  def set_cart
    @cart = Cart.find(params[:id])
  end
end
