class Public::PlacesController < ApplicationController
    def show
    	@place = Place.find(params[:id])
    	@place.update(show_count: @place.show_count + 1)
    	@hash = Gmaps4rails.build_markers(@place) do |place, marker|
          marker.lat place.latitude
          marker.lng place.longitude
          marker.infowindow place.address
        end
    end

end