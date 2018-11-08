class Went < ApplicationRecord
	belongs_to :user
	belongs_to :place

	has_many :went_prefectures
end
