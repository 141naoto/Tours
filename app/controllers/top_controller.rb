class TopController < ApplicationController
	def top
		@favorites = Place.find(Go.group(:place_id).order('count(place_id) desc').limit(4).pluck(:place_id))
		@show_ranking = Place.all.order(show_count: "DESC").limit(3)
		@comments = Comment.all.order(created_at: "DESC").limit(3)
		@comment_images = []
		@comments.each do |comment|
		 image = CommentImage.where(comment_id: comment.id).first
		 @comment_images << image
	    end
	end

	def search
		@random_place = Place.where( 'id >= ?', rand(Place.first.id..Place.last.id) ).firsts
		@regions = Region.all
		@prefectures = Prefecture.all
		@comments = Comment.all
		@tags =Hashtag.find(CommentsHashtag.group(:hashtag_id).order('count(hashtag_id) desc').all.pluck(:hashtag_id))
	end

	def search_index
		@places_search = Place.search(params[:search]).order(prefecture_id: "ASC")
	end
end
