class Went < ApplicationRecord
	belongs_to :user
    has_many :went_prefectures, dependent: :destroy
end
