class Admin::RecordsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@records = Record.all
	end

	def show
		@record = Record.find(params[:id])
	end

	def destroy
		@record = Record.find(params[:id])
		@record.destroy
		redirect_to admin_records_path
	end
end