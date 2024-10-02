# app/models/review.rb
class Review < ApplicationRecord
  belongs_to :book # A review belongs to a book
end
