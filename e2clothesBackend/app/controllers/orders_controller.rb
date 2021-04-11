class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]

  # GET /
  def index
    @orders = Order.all
    json_response(@orders)
  end

  # POST /orders
  def create
    @order = Order.create!(order_params)
    json_response(@order, :created)
  end

  # GET /orders/:id
  def show
    json_response(@order)
  end

  # PUT /orders/:id
  def update
    @order.update(order_params)
    head :no_content
  end

  # DELETE /orders/:id
  def destroy
    @order.destroy
    head :no_content
  end

  private

  # white list
  def order_params
    params.permit(:building_address, :city, :code, :email, :name, :phone, :state, :street_address, :zip_code,
                  :user_id, :created_at, :updated_at)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
