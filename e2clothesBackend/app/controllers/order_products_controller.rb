class OrderProductsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  # GET /
  def index
    @ops = Order.all
    json_response(@ops)
  end

  # POST /order_produts
  def create
    @op = OrderProduct.create!(order_params)
    json_response(@op, :created)
  end

  # GET /order_produts/:id
  def show
    json_response(@op)
  end

  # PUT /order_produts/:id
  def update
    @op.update(order_params)
    head :no_content
  end

  # DELETE /order_produts/:id
  def destroy
    @op.destroy
    head :no_content
  end

  private

  # white list
  def order_params
    params.permit(:price, :order_id, :product_id)
  end

  def set_item
    @op = OrderProduct.find(params[:id])
  end
end
