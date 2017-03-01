class Marksman < ApplicationRecord
	validates :startnr, uniqueness: true
	has_many :groups, through: :MarksmanGroups
	has_many :marksman_groups, dependent: :destroy
end
