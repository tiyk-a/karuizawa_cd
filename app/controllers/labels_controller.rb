class LabelsController < ApplicationController
  def index
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def label_params
  	params.require(:label).permit()
  end
end
