class CategoriesController < ApplicationController
  before_action :check_admin, only: [:create]

  def index
    @categories = Category.all.reverse_order
  end

  def new
    @category = Category.new
    @categories = Category.all.reverse_order
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id])
  end

  private
  def category_params
  	params.require(:category).permit(:category_name)
  end
end
