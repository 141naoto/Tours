class Admin::UsersController < ApplicationController
	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update
		redirect_to admin_user_path(@user.id)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admin_user_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :user_introduction, :profile_image)
	end
end