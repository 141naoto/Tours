class Public::SpotsController < ApplicationController

  def show
  	@spot = Spot.find(params[:id])
    @place = Place.find_by(place_name: @spot.spot_name)
    @place.update(show_count: @place.show_count + 1)
    redirect_to place_path(@place)
  end
end