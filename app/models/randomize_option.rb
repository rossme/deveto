class RandomizeOption < ApplicationRecord
  has_many :household_movies, dependent: :destroy
end
