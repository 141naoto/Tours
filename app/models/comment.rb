class Comment < ApplicationRecord
	belongs_to :season
	belongs_to :organization
	belongs_to :user
	belongs_to :place
	has_many :comments_hashtags
	has_many :likes
	has_many :comment_images, dependent: :destroy
	has_and_belongs_to_many :hashtags

	accepts_attachments_for :comment_images, attachment: :image

	validates_presence_of :season_id
	validates_presence_of :organization_id
	validates_presence_of :title

	  after_create do
    comment = Comment.find_by(id: self.id)
    hashtags  = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
      comment.hashtags << tag
    end
  end

  before_update do
    comment = Comment.find_by(id: self.id)
    comment.hashtags.clear
    hashtags = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
      comment.hashtags << tag
    end
  end
end
