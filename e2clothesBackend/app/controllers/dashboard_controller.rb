class DashboardController < ApplicationController
  def index
    data = {
      total_users: User.all.count,
      total_shops: Shop.all.count,
      total_products: Product.all.count
    }
    json_response data
  end
end
