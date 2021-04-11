class AddressesController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /
  def index
    @addresses = Address.all
    json_response(@addresses)
  end

  # POST /address
  def create
    @address = Address.create!(address_params)
    json_response(@address, :created)
  end

  # GET /users/:id
  def show
    json_response(@address)
  end

  # PUT /users/:id
  def update
    @address.update(address_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @address.destroy
    head :no_content
  end

  private

  # white list
  def address_params
    params.permit(:city, :building_address, :street_address, :zip_code)
  end

  def set_user
    @address = Address.find(params[:id])
  end
end
