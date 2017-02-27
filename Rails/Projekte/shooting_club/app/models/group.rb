class Group < ApplicationRecord
	has_many :marksmen, through: :marksman_group
	has_many :marksman_groups, dependent: :destroy
end
