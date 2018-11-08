class TopController < ApplicationController
	def top
		@places = Place.all
	end

	def search
		@region = Region.all
		@prefecture = Prefecture.all
	end
end
