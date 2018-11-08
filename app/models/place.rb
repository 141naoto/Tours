class Place < ApplicationRecord
	geocoded_by :address
    after_validation :geocode

	attachment :place_image

	belongs_to :prefecture
	has_many :gos, dependent: :destroy

	def favorited_by?(user)
          gos.where(user_id: user.id).exists?
    end
end
