class Project < ApplicationRecord
	has_many :iterations, dependent: :destroy
	
	validates :title, presence: true
end
