class CategoriesController < ApplicationController
  def index
  end

  def create
  end

  def show
  end

  private
  def category_params
  	params.require(:category).permit()
  end
end
