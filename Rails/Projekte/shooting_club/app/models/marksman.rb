class Marksman < ApplicationRecord
	validates :startnr, uniqueness: true
	has_many :groups, through: :MarksmanGroups
	has_many :marksman_groups, dependent: :destroy

	def self.search(search)
	  if search
	    where('surname LIKE ?', "%#{search}%")
	  else
	    where(nil)
	  end
	end

end
