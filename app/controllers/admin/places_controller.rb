class Admin::PlacesController < ApplicationController
	before_action :authenticate_admin!

	def new
		@place = Place.new
	end

	def index
		@false_places = Place.where(place_flag: false)
		@true_places = Place.where(place_flag: true)
	end

    def show
    	@place = Place.find(params[:id])
    	@hash = Gmaps4rails.build_markers(@place) do |place, marker|
          marker.lat place.latitude
          marker.lng place.longitude
          marker.infowindow place.address
        end
    end

	def create
		@place = Place.new(place_params)
		@place.show_count = 0
		if @place.save
		   redirect_to new_admin_place_path
		else
			render 'new'
		end
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])
		@place.place_flag = false
		@spots = Spot.where(spot_name: @place.place_name)
		if @place.update(place_params)
           @spots.update(spot_name: @place.place_name)
		   redirect_to admin_place_path(@place.id)
		else
			render 'edit'
		end
	end

	def destroy
		@place = Place.find(params[:id])
		if @place.destroy
			redirect_to admin_places_path, success:"削除しました"
		else
			render 'index', danger:"削除に失敗しました"
		end
	end

	private
	def place_params
		params.require(:place).permit(:prefecture_id, :place_name, :place_image, :place_introduction, :show_count, :hours, :address, :latitude, :longitude, :show_count, :place_flag)
	end

end