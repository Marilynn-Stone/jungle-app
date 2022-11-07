class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['AUTHENTICATE_USERNAME'], password: ENV['AUTHENTICATE_PASSWORD']
  
  def index
    @categories = Category.order(id: :name).all
  end

  def new
    @catagory = Catagory.new
  end

  def create
    @category = Catagory.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
