class TopController < ApplicationController
	def top
		@places = Place.all
	end

	def search
		@region = Region.all
		@prefecture = Prefecture.all
	end

	def search_index
		@places_search = Place.search(params[:search]).order(prefecture_id: "ASC")
	end
end
