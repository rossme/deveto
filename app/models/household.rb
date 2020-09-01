class Household < ApplicationRecord
  has_many :user_households
  has_many :users, through: :user_households
  has_many :household_movies
end
