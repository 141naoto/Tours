class Spot < ApplicationRecord
	belongs_to :record
	attachment :spot_image

	validates_presence_of :prefecture_id
end
