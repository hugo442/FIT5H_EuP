class MarksmanGroup < ApplicationRecord
	validates :marksman_id, numericality: { only_integer: true }
	belongs_to :marksman
	belongs_to :group
end
