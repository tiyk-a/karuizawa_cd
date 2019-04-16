class CdsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def cd_params
  	params.require(:cd).permit()
  end
end
