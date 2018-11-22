class Place < ApplicationRecord
	geocoded_by :place_name
    after_validation :geocode, if: :place_name_changed?

	attachment :place_image

	belongs_to :prefecture
	has_many :gos, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :went_prefectures, dependent: :destroy

	def self.search(search)
		if search
			Place.where(['place_name Like?', "%#{search}%"])
		else
			Place.all
		end
	end

	def favorited_by?(user)
          gos.where(user_id: user.id).exists?
    end

end
