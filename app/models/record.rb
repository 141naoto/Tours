class Record < ApplicationRecord
	belongs_to :user
	has_many :spots, inverse_of: :record, dependent: :destroy
	accepts_nested_attributes_for :spots, reject_if: :all_blank, allow_destroy: true
end
