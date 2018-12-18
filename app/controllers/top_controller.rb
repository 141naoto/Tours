class TopController < ApplicationController
	def top
		@favorites = Place.find(Go.group(:place_id).order('count(place_id) desc').limit(4).pluck(:place_id))
		@show_ranking = Place.all.order(show_count: "DESC").limit(3)
=begin
		a = Comment.arel_table
		b = CommentImage.arel_table
		condition = b[:comment_id].eq(a[:id])
		@comments = Comment.where(CommentImage.where(condition).exists).order(created_at: "DESC").limit(3)
=end
		@comments = []
		cnt = 0
		Comment.all.order(created_at: "DESC").each do |a|
			break if cnt == 3
				if a.comment_images.count != 0
					@comments << a
					cnt +=1
				end
		end

		@comment_images = []
		@comments.each do |comment|
			if comment.comment_images.present?
		 		image = CommentImage.where(comment_id: comment.id).first
		 		@comment_images << image
		 	end
	    end

	    @records = Record.all.order(created_at: "DESC").limit(3)
	    @spots = []
	    @records.each do |record|
	    	spot = Spot.where(record_id: record.id).first
	    	@spots << spot
	    end
	end

	def search
		@random_place = Place.where( 'id >= ?', rand(Place.first.id..Place.last.id) ).first
		@regions = Region.all
		@prefectures = Prefecture.all
		@comments = Comment.all
	end

	def search_index
		@places_search = Place.search(params[:search]).order(prefecture_id: "ASC")
	end
end
