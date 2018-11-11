class Public::UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@went = Went.find_by(user_id: @user.id)
		@went_prefecture = WentPrefecture.where(went_id: @went.id)
		places = @went_prefecture.pluck(:place_id)
		@went_places = Place.where(id: places).order(prefecture_id: "DESC")
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :user_introduction, :profile_image)
	end
end