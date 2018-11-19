class Public::WentPrefecturesController < Public::ApplicationController
	before_action :authenticate_user!
	def create
			@place = Place.find(params[:place_id])
			went = Went.where(user_id: current_user.id).last
			went_place = @place.went_prefectures.where(went_id: went.id)
			went_prefecture = WentPrefecture.where(went_id: went.id, prefecture_id: @place.prefecture_id)
		if went_prefecture.empty?
			went.update(prefecture_count: went.prefecture_count + 1)
			went_prefecture = WentPrefecture.new
			went_prefecture.went_id = went.id
			went_prefecture.place_id = @place.id
			went_prefecture.prefecture_id = @place.prefecture_id
			went_prefecture.save
			redirect_to place_path(@place), success: '行ったリストに登録しました'

		elsif went_place.empty?
			went_prefecture = WentPrefecture.new
			went_prefecture.went_id = went.id
			went_prefecture.place_id = @place.id
			went_prefecture.prefecture_id = @place.prefecture_id
			went_prefecture.save
			redirect_to place_path(@place), success: '行ったリストに登録しました'
		else
			redirect_to place_path(@place), danger: '行ったリストに登録済です'
		end
	end
end