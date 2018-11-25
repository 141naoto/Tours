class Public::GoesController < ApplicationController
    before_action :authenticate_user!
	def goes_list
	    @usergos = current_user.gos
        if @usergos.count > 0
           places = @usergos.pluck(:place_id)
           @goplaces = Place.where(id: places)
           prefectures = @goplaces.pluck(:prefecture_id)
           @goprefectures = Prefecture.where(id: prefectures)
        else redirect_to root_path
        end
    end

	def create
        place = Place.find(params[:place_id])
        go = current_user.gos.new(place_id: place.id)
        go.save
        redirect_to place_path(place)
    end

    def destroy
        place = Place.find(params[:place_id])
        go = current_user.gos.find_by(place_id: place.id)
        go.destroy
        redirect_to place_path(place)
    end
end