class Public::CommentsController < ApplicationController
	def new
		@comment = Comment.new
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
	    	render 'new'
	    end
	end

	def show
		@comment = Comment.find(params[:id])
	end

  private
	def comment_params
		params.require(:comment).permit(:user_id, :place_id, :season_id, :organization_id, :text, :title, :comment_image)
	end
end