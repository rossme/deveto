class Household < ApplicationRecord
  has_many :user_households
  has_many :users, through: :user_households
  has_many :household_movies
  has_many :movies, through: :household_movies
  has_many :randomize_options, through: :household_movies
end
