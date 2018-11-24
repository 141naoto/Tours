class Public::SpotsController < ApplicationController

  def show
  	@spot = Spot.find(params[:id])
    @place = Place.find_by(place_name: @spot.spot_name)
    if @place.present?
    	@place.update(show_count: @place.show_count + 1)
    	redirect_to place_path(@place)
    else
    	redirect_to record_path(@spot.record_id), danger:"情報がありませんでした"
    end
  end
end