class Comment < ApplicationRecord
	belongs_to :season
	belongs_to :organization
	belongs_to :user
	belongs_to :place
	has_many :hashtag_comment
	has_many :likes

	attachment :comment_image

	validates_presence_of :season_id
	validates_presence_of :organization_id
	validates_presence_of :title
	validates_presence_of :comment_image
end
