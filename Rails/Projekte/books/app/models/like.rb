class Like < ApplicationRecord
  belongs_to :book

  validates :quality, numericality: { less_than_or_equal_to: 5 }
end
