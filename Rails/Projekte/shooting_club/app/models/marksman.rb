class Marksman < ApplicationRecord
	has_many :groups, through: :marksman_group
	has_many :marksman_groups, dependent: :destroy
end
