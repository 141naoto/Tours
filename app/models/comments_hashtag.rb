class CommentsHashtag < ApplicationRecord
	belongs_to :hashtag
	belongs_to :comment
	validates :comment_id, presence: true
	validates :hashtag_id, presence: true
end
