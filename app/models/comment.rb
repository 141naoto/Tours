class Comment < ApplicationRecord
	belongs_to :season
	belongs_to :organization
	belongs_to :user
	belongs_to :place
	has_many :hashtag_comment
	has_many :likes
end
