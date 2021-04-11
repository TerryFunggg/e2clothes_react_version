class ShopStuffsController < ApplicationController
  before_action :set_shop, only: %i[show update destroy]

  # GET /
  def index
    @shops = ShopStuff.all
    json_response(@shops)
  end

  # POST /shop_stuff
  def create
    @shop = ShopStuff.create!(shop_params)
    json_response(@shop, :created)
  end

  # GET /shop_stuff/:id
  def show
    json_response(@shop)
  end

  # PUT /shop_stuff/:id
  def update
    @shop.update(shop_params)
    head :no_content
  end

  # DELETE /shop_stuff/:id
  def destroy
    @shop.destroy
    head :no_content
  end

  private

  # white list
  def shop_params
    params.permit(:file, :shop_id)
  end

  def set_shop
    @shop = ShopStuff.find(params[:id])
  end
end
