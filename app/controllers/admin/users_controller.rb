class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@went = Went.find_by(user_id: @user.id)
		@went_prefecture = WentPrefecture.where(went_id: @went.id)
		places = @went_prefecture.pluck(:place_id)
		@went_places = Place.where(id: places).order(prefecture_id: "ASC")
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