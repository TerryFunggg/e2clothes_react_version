class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  # GET /
  def index
    @products = Product.search(params[:q])
    @products = @products.pages(page: params[:_start]) if params[:_start].present?
    total_count_header @products.count
    json_response(@products)
  end

  # POST /products
  def create
    me = current_user
    product_params[:decription] = product_params[:description] unless product_params[:description].nil?
    @product = Product.new(product_params)
    @product.shop = me.shop
    @product.image.attach(params[:image]) if params[:image]
    @product.save!
    json_response({ message: 'ok' }, :created)
  end

  # GET /products/:id
  def show
    json_response(@product)
  end

  # PUT /products/:id
  def update
    product_params[:decription] = product_params[:description] unless product_params[:description].nil?
    @product.update(product_params)
    json_response({ message: 'ok' }, :ok)
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    head :no_content
  end

  private

  # white list
  def product_params
    params.permit(:name, :price, :quality, :shop_id, :description, :decription, :is_active, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
