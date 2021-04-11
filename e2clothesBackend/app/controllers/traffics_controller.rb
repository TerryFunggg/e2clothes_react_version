class TrafficsController < ApplicationController
  before_action :set_rate, only: %i[show update destroy]

  # GET /
  def index
    @traffics = Rate.all
    json_response(@traffics)
  end

  # POST /traffics
  def create
    @traffic = Traffic.create!(traffic_params)
    json_response(@traffic, :created)
  end

  # GET /traffics/:id
  def show
    json_response(@traffic)
  end

  # PUT /traffics/:id
  def update
    @traffic.update(traffic_params)
    head :no_content
  end

  # DELETE /traffics/:id
  def destroy
    @traffic.destroy
    head :no_content
  end

  private

  # white list
  def traffic_params
    params.permit(:user_id, :product_id)
  end

  def set_rate
    @traffic = Traffic.find(params[:id])
  end
end
