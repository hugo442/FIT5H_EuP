class Movie < ApplicationRecord
	has_many :reviews, dependent: :destroy

	validates :name, :description, :location, presence: true
	validates :comment, length: { minimum: 25 }
	validates :stars, numericality: { greater_than_or_equal_to: 0 }

	def free?
		price.blank? || price.zero?
	end
end
