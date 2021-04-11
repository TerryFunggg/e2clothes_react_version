class ProductPicturesController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  # GET /
  def index
    @pps = ProductPicture.all
    json_response(@pps)
  end

  # POST /product_pictures
  def create
    @pp = ProductPicture.create!(pp_params)
    json_response(@pp, :created)
  end

  # GET /product_pictures/:id
  def show
    json_response(@pp)
  end

  # PUT /product_pictures/:id
  def update
    @pp.update(pp_params)
    head :no_content
  end

  # DELETE /product_pictures/:id
  def destroy
    @pp.destroy
    head :no_content
  end

  private

  # white list
  def pp_params
    params.permit(:img, :index, :product_id)
  end

  def set_item
    @pp = ProductPicture.find(params[:id])
  end
end
