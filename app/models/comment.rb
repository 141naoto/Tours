class Comment < ApplicationRecord
	belongs_to :season
	belongs_to :organization
	belongs_to :user
	belongs_to :place
	has_many :hashtag_comment
	has_many :likes
	has_many :comment_images, dependent: :destroy

	accepts_attachments_for :comment_images, attachment: :image

	validates_presence_of :season_id
	validates_presence_of :organization_id
	validates_presence_of :title
	validates_presence_of :comment_images
end
