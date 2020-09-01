class HouseholdMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :household
  belongs_to :randomize_option
end
