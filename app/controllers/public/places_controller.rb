class Public::PlacesController < ApplicationController
    def show
    	@place = Place.find(params[:id])
    	@hash = Gmaps4rails.build_markers(@place) do |place, marker|
          marker.lat place.latitude
          marker.lng place.longitude
          marker.infowindow place.address
        end
        @comments = @place.comments.order(created_at: "DESC").limit(3)
        @place_comments = @place.comments
    end

    def show_count
    	@place = Place.find(params[:place_id])
    	@place.update(show_count: @place.show_count + 1)
    	redirect_to place_path(@place)
    end

end