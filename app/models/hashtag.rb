class Hashtag < ApplicationRecord
	has_many :comments_hashtags
	has_and_belongs_to_many :comments

	validates :name, presence: true, length: {maximum:99}
	validates_uniqueness_of :name
end
