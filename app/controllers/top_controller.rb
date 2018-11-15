class TopController < ApplicationController
	def top
		@places = Place.all
		@show_ranking = Place.all.order(show_count: "DESC").limit(3)
		@comments = Comment.all.order(created_at: "DESC").limit(3)
		@random_place = Place.where( 'id >= ?', rand(Place.first.id..Place.last.id) ).first
	end

	def search
		@regions = Region.all
		@prefectures = Prefecture.all
		@comments = Comment.all
	end

	def search_index
		@places_search = Place.search(params[:search]).order(prefecture_id: "ASC")
	end
end
