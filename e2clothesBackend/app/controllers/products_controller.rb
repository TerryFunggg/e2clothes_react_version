class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  # GET /
  def index
    @products = Product.all
    json_response(@products)
  end

  # POST /products
  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  # GET /products/:id
  def show
    json_response(@product)
  end

  # PUT /products/:id
  def update
    @product.update(product_params)
    head :no_content
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    head :no_content
  end

  private

  # white list
  def product_params
    params.permit(:name, :price, :quality, :shop_id, :description, :is_active)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
