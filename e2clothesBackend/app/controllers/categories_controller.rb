class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  # GET /
  def index
    @categories = Category.all
    json_response(@categories)
  end

  # POST /categories
  def create
    @category = Category.create!(category_params)
    json_response(@category, :created)
  end

  # GET /categories/:id
  def show
    json_response(@category)
  end

  # PUT /categories/:id
  def update
    @category.update(category_params)
    head :no_content
  end

  # DELETE /categories/:id
  def destroy
    @category.destroy
    head :no_content
  end

  private

  # white list
  def category_params
    params.permit(:name, :product_id)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
