class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show update destroy]

  # GET /
  def index
    @shops = Shop.all
    @shops = @shops.pages(page: params[:_start]) if params[:_start].present?
    total_count_header @shops.count
    json_response(@shops)
  end

  # POST /shops
  def create
    @shop = Shop.create!(shop_params)
    json_response(@shop, :created)
  end

  # GET /shops/:id
  def show
    json_response(@shop)
  end

  # PUT /shops/:id
  def update
    @shop.update(shop_params)
    head :no_content
  end

  # DELETE /shops/:id
  def destroy
    @shop.destroy
    head :no_content
  end

  def applyshop
    @shop = Shop.new(title: shop_params[:title], description: shop_params[:description], state: Shop::IS_OPEN)
    @shop.user = current_user
    @shop.address = Address.create(
      city: shop_params[:city],
      zipCode: shop_params[:zipCode],
      streetAddress: shop_params[:streetAddress],
      buildingAddress: shop_params[:buildingAddress]
    )
    @shop.save!
    @shop.logo.attach(shop_params[:logo])
    # update user as shoper
    current_user.role = User::SELLER
    current_user.save!
    json_response({message: "ok"}, :created)
  end

  def updateshop
    shop = current_user.shop
    shop.update(title: shop_params[:title], description: shop_params[:description], state: Shop::IS_OPEN)
    shop.address.update(
      city: shop_params[:city],
      zipCode: shop_params[:zipCode],
      streetAddress: shop_params[:streetAddress],
      buildingAddress: shop_params[:buildingAddress]
    )
    shop.save!
    shop.logo.attach(shop_params[:logo]) if shop_params[:logo]
    json_response({message: "ok"}, :created)
  end

  private

  # white list
  def shop_params
    params.permit(:title, :state, :slug, :logo, :description, :user_id, :address_id, :zipCode, :buildingAddress,
                  :streetAddress, :city)
  end

  def set_shop
    shop = Shop.find(params[:id])
  end
end
