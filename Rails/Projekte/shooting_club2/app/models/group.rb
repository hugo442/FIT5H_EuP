class Group < ApplicationRecord
	has_many :marksmen, through: :MarksmanGroups
	has_many :marksman_groups, dependent: :destroy
end
