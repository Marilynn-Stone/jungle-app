class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ENV['AUTHENTICATE_USERNAME'], password: ENV['AUTHENTICATE_PASSWORD']

  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
