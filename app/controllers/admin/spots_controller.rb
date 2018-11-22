class Admin::SpotsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@spots = Spot.all
	end

	def show
		@spot = Spot.find(params[:id])
	end

	def destroy
		@spot = Spot.find (params[:id])
		@spot.destroy
		redirect_to admin_spots_path
	end
end