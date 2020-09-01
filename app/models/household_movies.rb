class HouseholdMovies < ApplicationRecord
  belongs_to :movies
  belongs_to :households
  belongs_to :randomize_option
end
