class ApplicationController < ActionController::Base
	before_action :set_search

	def after_sign_in_path_for(resource)
		cds_path
	end

	def after_sign_out_path_for(resource)
		cds_path
	end

	def set_search
	@search = Cd.ransack(params[:q])
  	@search_cds = @search.result.includes(:artist)
	end

	private
  def search_params
    params.require(:q).permit(:cd_title_cont)
  end
end
