class Admin::PlacesController < ApplicationController
	before_action :authenticate_admin!

	def new
		@place = Place.new
	end

	def index
		@places = Place.all
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
		@place.save
		redirect_to new_admin_place_path
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])
		@place.update(place_params)
		redirect_to admin_place_path(@place.id)
	end

	def destroy
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to admin_places_path
	end

	private
	def place_params
		params.require(:place).permit(:prefecture_id, :place_name, :place_image, :place_introduction, :show_count, :hours, :address, :latitude, :longitude, :show_count)
	end

end