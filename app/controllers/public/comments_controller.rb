class Public::CommentsController < ApplicationController
	before_action :authenticate_user!, only:[:new, :create]
	def new
		@comment = Comment.new
		@comment.comment_images.build
		@season = Season.all
		@organization = Organization.all
	end

	def create
		@place = Place.find(params[:place_id])
		@comment = current_user.comments.new(comment_params)
		@comment.place_id = @place.id
		if @comment.save
		   redirect_to place_path(@place.id)
	    else
			@season = Season.all
			@organization = Organization.all
	    	render 'public/comments/new'
	    end
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def hashtag
		@tag = Hashtag.find_by(name: params[:name])
		@comments = @tag.comments.all
	end

	def comment_index
		@place = Place.find(params[:place_id])
		@place_comments = @place.comments
	end

  private
	def comment_params
		params.require(:comment).permit(:user_id, :place_id, :season, :organization, :text, :title, comment_images_images: [])
	end
end