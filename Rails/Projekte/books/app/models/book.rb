class Book < ApplicationRecord
	has_many :likes, dependent: :destroy
end
