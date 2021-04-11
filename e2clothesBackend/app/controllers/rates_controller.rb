class RatesController < ApplicationController
  before_action :set_rate, only: %i[show update destroy]

  # GET /
  def index
    @rates = Rate.all
    json_response(@rates)
  end

  # POST /rates
  def create
    @rate = Rate.create!(product_params)
    json_response(@rate, :created)
  end

  # GET /rates/:id
  def show
    json_response(@rate)
  end

  # PUT /rates/:id
  def update
    @rate.update(product_params)
    head :no_content
  end

  # DELETE /rates/:id
  def destroy
    @rate.destroy
    head :no_content
  end

  private

  # white list
  def product_params
    params.permit(:rate, :user_id, :product_id)
  end

  def set_rate
    @rate = Rate.find(params[:id])
  end
end
