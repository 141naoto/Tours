class WentsController < ApplicationController
	def went_prefecture
		@place = Place.find(params[:id])
		went = Went.where(user_id: current_user.id)

		went_places = went.went_prefectures.find_by(place_id: params[:place_id])
		went_prefectures = went.went_prefectures.find_by(prefecture_id: params[:prefecture_id])
		if went_places.nil?
			went_prefecture = WentPrefecture.new
			went_prefecture.went_id = went.id
			went_prefecture.place_id = params[:place_id]
			went_prefecture.prefecture_id = @place.prefecture_id
			went_prefecture.save
		else
			redirect_to root_path
		end
		if went_prefectures.nil?
			went.update(prefecture_count: went.prefecture_count + 1)
			redirect_to place_path(@place)
		else
			redilect_to root_path
		end
	end
end
