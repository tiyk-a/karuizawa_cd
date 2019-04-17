class LabelsController < ApplicationController
  def index
    @label = Label.new
    @labels = Label.all.reverse_order
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      flash[:notice] = "New Label Saved!"
      redirect_to labels_path
    else
      flash[:notice] = "Error!"
      render :index
    end
  end

  def update
  end

  def destroy
  end

  private
  def label_params
  	params.require(:label).permit(:label_name)
  end
end
