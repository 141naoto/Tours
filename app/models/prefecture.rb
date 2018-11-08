class Prefecture < ApplicationRecord
	has_many :places
	belongs_to :region
end
