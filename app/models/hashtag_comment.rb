class HashtagComment < ApplicationRecord
	belongs_to :hashtag
	belongs_to :comment
end
